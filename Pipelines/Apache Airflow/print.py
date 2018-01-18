#Source: https://github.com/hgrif/airflow-tutorial

import datetime as dt

from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators.python_operator import PythonOperator


def print_world():
    print('world')


default_args = {
    'owner': 'me',
    'start_date': dt.datetime(2017, 6, 1),
    'retries': 1,
    'retry_delay': dt.timedelta(minutes=5),
}


with DAG('airflow_tutorial_v01',
         default_args=default_args,
         schedule_interval='0 * * * *',
         ) as dag:

    print_hello = BashOperator(task_id='print_hello',
                               bash_command='echo "hello"')
    sleep = BashOperator(task_id='sleep',
                         bash_command='sleep 5')
    print_world = PythonOperator(task_id='print_world',
                                 python_callable=print_world)


print_hello >> sleep >> print_world



# Testing Commands
# Check if python code is valid -> $ python airflow_tutorial.py
# Test task for execution date  -> $ airflow test airflow_tutorial_v01 print_world 2017-07-01
    # This runs the task locally as if it was for 2017-07-01, ignoring other tasks and without communicating to the database.

