import luigi

class MyExampleTask(luigi.Task):

    # Example parameter for our task: a 
    # date for which a report should be run
    report_date = luigi.DateParameter()

    def requires(self):
        """
        Which other Tasks need to be complete before
        this Task can start? Luigi will use this to 
        compute the task dependency graph.
        """
        return [MyUpstreamTask(self.report_date)]

    def output(self):
        """
        When this Task is complete, where will it produce output?
        Luigi will check whether this output (specified as a Target) 
        exists to determine whether the Task needs to run at all.
        """
        return S3Target('s3://my-output-bucket/my-example-tasks-output')

    def run(self):
        """
        How do I run this Task?
        Luigi will call this method if the Task needs to be run.
        """
        # We can do anything we want in here, from calling python
        # methods to running shell scripts to calling APIs