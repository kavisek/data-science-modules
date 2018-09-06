import luigi
 
class PrintNumbers(luigi.Task):
 
    def requires(self):
        return []
 
    def output(self):
        return luigi.LocalTarget("numbers_up_to_10.txt")
        print('Done')
 
    def run(self):
        with self.output().open('w') as f:
            for i in range(1, 11):
                f.write("{}\n".format(i))