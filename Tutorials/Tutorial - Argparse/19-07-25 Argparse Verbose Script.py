
# Tutorial Link: https://www.instapaper.com/read/1217002039

import argparse

parser = argparse.ArgumentParser(description='Demo')
parser.add_argument('--verbose',action='store_true',help='verbose flag')

args = parser.parse_args()

# Shell Output
if args.verbose:
    print("~ Verbose!")
else:
    print("~ Not so verbose")

# Command to run the script
# python 19-07-25\ Argparse\ Script.py --verbose
# python 19-07-25\ Argparse\ Script.py
# python 19-07-25\ Argparse\ Script.py --help
# python 19-07-25\ Argparse\ Script.py --testing #This will fail unknown argument

# Notes
# - The action parameter tells argparse to store true if the flag is found, otherwise it stores false.
# - Also a great thing about using argparse is you get built-in help
# - You can try it out by passing in an unknown parameter, -h or --help
