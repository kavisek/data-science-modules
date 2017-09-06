from sklearn.feature_extraction.text import HashingVectorizer, CountVectorizer
def comparison_test():
    sklearn_hashing_trick = HashingVectorizer(n_features=20, binary=True, norm=None) 
    one_hot_enconder = CountVectorizer()
    texts = ['Python for data science','Python for machine learning']
    one_hot_enconded = one_hot_enconder.fit_transform(texts)
    hashing = sklearn_hashing_trick.transform(texts)
    