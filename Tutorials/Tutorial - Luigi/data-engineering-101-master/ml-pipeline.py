import luigi
import csv
import pickle
import inspect, os
import requests
from os import listdir
import numpy as np
import subprocess
from luigi import six
from sklearn.decomposition import NMF
from sklearn.feature_extraction.text import TfidfVectorizer, CountVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.cross_validation import train_test_split

# Load data from files
class InputText(luigi.ExternalTask):
    """
    This class represents something that was created elsewhere by an external process,
    so all we want to do is to implement the output method.
    """
    filename = luigi.Parameter()

    def output(self):
        """
        Returns the target output for this task.
        In this case, it expects a file to be present in the local file system.
        :return: the target output for this task.
        :rtype: object (:py:class:`luigi.target.Target`)
        """

        # The directory containing this file
        root = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe()))) + "/"
        return luigi.LocalTarget(root + self.filename)

## Vectorize Data
class Vectorize(luigi.Task):
    input_dir = luigi.Parameter()
    evaluate = luigi.BoolParameter(default=False)

    def requires(self):
        return [ InputText(self.input_dir + '/' + filename)
                for filename in listdir(self.input_dir) ]

    def run(self):
        corpus = []
        labels = []

        vectorizer = TfidfVectorizer()

        for f in self.input(): # The input() method is a wrapper around requires() that returns Target objects
            with f.open('r') as fh:
                labels.append(fh.readline().strip())
                corpus.append(fh.read())

        corpus, X_test, labels, y_test = train_test_split(corpus, labels, test_size=.3)

        if self.evaluate:
            corpus, X_test, labels, y_test = train_test_split(corpus, labels, test_size=.3)

            # output test/train splits
            xt = self.output()[3].open('w')
            yt = self.output()[4].open('w')
            
            pickle.dump(X_test, xt)
            pickle.dump(y_test, yt)
            xt.close()
            yt.close()

        X = vectorizer.fit_transform(corpus)

        fc = self.output()[0].open('w')
        fv = self.output()[1].open('w')
        fl = self.output()[2].open('w')
        pickle.dump(X, fc)
        pickle.dump(vectorizer, fv)
        fl.write(','.join(labels))
        fc.close()
        fv.close()
        fl.close()

        files = {'filedata': self.output()[1].open()}
        requests.post('http://0.0.0.0:8081/vectorizer', files=files)

    def output(self):
        targets = [luigi.LocalTarget('models/corpus.pickle'),
                   luigi.LocalTarget('models/vectorizer.pickle'),
                   luigi.LocalTarget('models/labels.csv')]

        if self.evaluate:
            targets.append(luigi.LocalTarget('models/x-test.pickle'))
            targets.append(luigi.LocalTarget('models/y-test.pickle'))

        return targets

## Train (and serialize) Model
class TrainClassifier(luigi.Task):
  input_dir = luigi.Parameter()
  lam = luigi.FloatParameter(default=1.0)
  evaluate = luigi.BoolParameter(default=False)

  def requires(self):
    return Vectorize(self.input_dir, True)

  def run(self): 
    # deserialize inputs
    vectorizer = pickle.load(self.input()[1].open('r'))
    X = pickle.load(self.input()[0].open('r'))
    y = self.input()[2].open('r').read().split(',')
    c = MultinomialNB(alpha=self.lam)

    c.fit(X, y)

    f = self.output().open('w')
    pickle.dump(c, f)
    f.close()

  def output(self):
    return luigi.LocalTarget('models/model-alpha-%.2f.pickle' % self.lam)

class EvaluateModel(luigi.Task):
    input_dir = luigi.Parameter()
    lam = luigi.FloatParameter(default=1.0)

    def requires(self):
        return [TrainClassifier(self.input_dir, self.lam, True),
                Vectorize(self.input_dir, True)]

    def run(self):
        model = pickle.load(self.input()[0].open('r'))
        X_test = pickle.load(self.input()[1][3].open('r'))
        y_test = np.array(pickle.load(self.input()[1][4].open('r')))

        vectorizer = pickle.load(self.input()[1][1].open('r'))

        probabilities = model.predict_proba(vectorizer.transform(X_test))
        pr = np.where(y_test == y_test[1], 0, 1)
        
        out = zip(pr, probabilities[:,0])

        f = self.output().open('w')
        writer = csv.writer(f, delimiter='\t')
        writer.writerow(('actual', 'pred_score'))
        writer.writerows(out)
        f.close()

    def output(self):
        # remember that you need to return from outputs() function
        return luigi.LocalTarget('topmodel/data/nb-alpha-%.2f/scores.tsv' % self.lam)

# Offshoots

## Build Topic Models
class TopicModel(luigi.Task):
  input_dir = luigi.Parameter()
  num_topics = luigi.IntParameter(default=10)

  def requires(self):
    return Vectorize(self.input_dir)

  def run(self):
    corpus, vect, lab = self.input()

    # deserialize inputs
    vectorizer = pickle.load(vect.open('r'))
    X = pickle.load(corpus.open('r'))
    labels = lab.open('r').read().split(',')

    nmf = NMF(n_components=self.num_topics).fit(X)

    f = self.output().open('w')
    pickle.dump(nmf, f)
    f.close()

  def output(self):
    return luigi.LocalTarget('models/model-topic-%d.pickle' % self.num_topics)

class DeployModels(luigi.Task):
    '''
    A Task that packages a model as an API and deploys the specified models 
    to a cloud service.
    '''
    input_dir = luigi.Parameter()
    lam = luigi.FloatParameter(default=1.0)

    def requires(self):
        return TrainClassifier(self.input_dir, self.lam, False)

    def run(self):
        import shutil

        files = {'filedata': self.input().open()}

        requests.post('http://0.0.0.0:8081/refresh', files=files)

        shutil.copy2(self.input().path, self.output().path)

    def output(self):
        return luigi.LocalTarget('deployed/model-alpha-%.2f.pickle' % self.lam)

class BuildModels(luigi.Task):
    input_dir = luigi.Parameter()
    lam = luigi.FloatParameter(default=1.0)
    num_topics = luigi.IntParameter(default=10)

    def requires(self):
        return [TrainClassifier(self.input_dir, self.lam, False),
                TopicModel(self.input_dir, self.num_topics)]

if __name__ == '__main__':
    luigi.run()
