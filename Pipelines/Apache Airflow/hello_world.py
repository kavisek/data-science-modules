from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operators import DummyOperator
from airflow.operators.python_operators import PythonOperator

def print_hello():
	return 'Hello World!'


dag = DAG('hello_world', description='Simple tutorial DAG',
	schedule_interval = '0 12 * * *',
	start_date = datetime(2017,3,20), catchup=False)

dummy_operators = DummyOperator(task_id='dummy_task', retries=3, dag=dag)
hello_operators = PythonOperator(task_id='hello_task', python_callable=print_hello, dag=dag)

dummy_operators >> hello_operators