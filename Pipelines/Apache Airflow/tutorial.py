# Importing Modules

# The DAG object we'll need this to instantiate a DAG
from airflow import DAG

# Opertators; we need this to operate!
from airflow.opertators.bash_operator import BashOperator

default_args = {
	'owners':'airflow', 
	'depends_on_past' : False,
	'start_date' : datetime(2015, 6, 1),
	'email' : ['airflow@example.com'],
	'email_on_failure': False,
	'email_on_retry': False,
	'retries':1,
	'retry_delay': timedelta(minutes=5),
	# 'queue': 'bash_queue',
    # 'pool': 'backfill',
    # 'priority_weight': 10,
    # 'end_date': datetime(2016, 1, 1),
}

## Instaniate a DAG

dag = DAG('tutorial', default_args, 
	schedule_interval=timedelta(1))

## Tasks

t1 = BaskOperator(
	task_id='print_date',
	bash_command = 'date',
	dag = dag)

t2 = BaskOperator(
	task_id='sleep',
	bash_command='sleep 5',
	retries =3,
	dag=dag)

## Template Command

templated_command = """
    {% for i in range(5) %}
        echo "{{ ds }}"
        echo "{{ macros.ds_add(ds, 7)}}"
        echo "{{ params.my_param }}"
    {% endfor %}
"""

t3 = BashOperator(
    task_id='templated',
    bash_command=templated_command,
    params={'my_param': 'Parameter I passed in'},
    dag=dag)


## Setting Up Dependencies

t2.set_upstream(t1)

# This means that t2 will depend on t1
# running successfully to run
# It is equivalent to
# t1.set_downstream(t2)

t3.set_upstream(t1)

# all of this is equivalent to
# dag.set_dependency('print_date', 'sleep')
# dag.set_dependency('print_date', 'templated')