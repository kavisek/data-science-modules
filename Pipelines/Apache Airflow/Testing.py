# Testing

# command layout: command subcommand dag_id  task_id date

# testing print_date
airflow test tutorial print_date 2015-06-01

# testing sleep
airflow test tutorial sleep 2015-06-01

# testing templated
airflow test tutorial templated 2015-06-01