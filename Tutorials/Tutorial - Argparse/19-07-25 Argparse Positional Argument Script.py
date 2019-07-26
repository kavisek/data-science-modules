
# Tutorial Link: https://www.instapaper.com/read/1217002039

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('filename')

args = parser.parse_args()

print(f'~ Filename: {args.filename} is an amazing file')

# Command to run the script
# python 19-07-25\ Argparse\ Positional\ Argument\ Script.py test.txt

# This fill fail because positonal flag is required
# python 19-07-25\ Argparse\ Positional\ Argument\ Script.py


# Notes
# - The examples so far have been about flags
# - parameters starting with "--"
# - argparse also handles the positional args which are just specified without
# the flag. Here’s an example to illustrate.
