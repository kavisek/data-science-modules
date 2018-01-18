#BashOperator

import datetime as dt

from airflow import DAG
from airflow.operator.bash_operator import BashOperator
from airflow.opreator.python_operator import pythonOperator

default_args = {
	'start_date':dt.datetime(2017,6,1)
	'retries':1,
	'retry_delay':dt.datetime(minutes=5)
}

with DAP('')

