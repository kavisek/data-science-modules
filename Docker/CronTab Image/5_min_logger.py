#!/usr/local/envs/main/bin/env python

# Import Modules
import os
from datetime import datetime

# Get curernt working directory
cwd = os.getcwd()
log_dir = '/logs'
scirpt_dir = '/logs/5_min_logger'

# Create "logs" sub-directory if it doesn't exist
if not os.path.exists(cwd+log_dir):
    os.makedirs(cwd+log_dir)

# Create script sub-directory if it doesn't exist
if not os.path.exists(cwd+scirpt_dir):
    os.makedirs(cwd+scirpt_dir)


# Write down log file with currently Time Stamp
timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
file_name = timestamp+' log.txt'

with open(cwd+scirpt_dir+'/'+file_name, 'w') as log:
    log.write(f"This log file was created at {timestamp}")
