#!/usr/bin/env bash

# This script will automatically run every time this user account start_date.
# THe script will start Juptyer Notebooks, Apache Airflow, and
# Launch our Docker images, which containe our databases.

# Testing Completion
cd /Users/kavi/Desktop/
touch doing2.txt

# Start Jupyter Notebook
source /Users/kavi/anaconda3/bin/activate main && screen -d -m jupyter notebook
sleep 2

# Start Docker Databases
docker start test-mysql
sleep 2

# Start Apache Airflow
source activate airflow
screen -d -m  airflow webserver -p 8080
sleep 2

# Start Apache Scheduler
screen -d -m  airflow scheduler
sleep 2

# Testing Completion
cd Desktop/
touch done2.txt

# bash /Users/kavi/Documents/DataScience/Other/startup2.sh
