#!/usr/bin/env bash

# Start Jupyter Notebook

cd /Users/kavi/Desktop/
echo $PATH >> done.txt

cd /Users/kavi/Documents/
source /Users/kavi/anaconda3/bin/activate main && screen -d -m jupyter notebook
