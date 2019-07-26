
# Tutorial Link: https://www.instapaper.com/read/1217002039

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('filename')
parser.add_argument('filename2')

args = parser.parse_args()

print(f'~ Filename: {args.filename} is the first positional flag')
print(f'~ Filename: {args.filename2} is the second positional flag')py

# Command to run the script
# 19-07-25\ Argparse\ Multiple\ Positional\ Argument\ Script.py test.txt test2.txt

# This fill fail because one or more positonal flags are missing
# 19-07-25\ Argparse\ Multiple\ Positional\ Argument\ Script.py test.txt
# 19-07-25\ Argparse\ Multiple\ Positional\ Argument\ Script.py


# Notes
# - The examples so far have been about flags
# - parameters starting with "--"
# - argparse also handles the positional args which are just specified without
# the flag. Here’s an example to illustrate.
