import os
import pandas as pd
from datetime import datetime


class ReportHandler:

    def create_data(subdir='data'):

        subdir = '/' + subdir
        if os.path.exists(os.getcwd()+subdir) is False:
            os.mkdir(os.getcwd()+subdir)

    def create_date_range(subdir='data', start='2019-01-01', end='2019-02-03'):

        subdir = '/' + subdir
        handler = ReportHandler
        handler.create_data(subdir)

        folders = pd.date_range(start='2019-01-01', end='2019-12-31')
        folders = folders.to_series().astype(str).to_list()

        for folder in folders:
            folder = '/' + folder
            if os.path.exists(os.getcwd()+subdir+folder) is False:
                os.mkdir(os.getcwd()+subdir+folder)


def main():
    handler = ReportHandler
    handler.create_date_range()


# Run script
main()
