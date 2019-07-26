
# Tutorial Link: https://www.instapaper.com/read/1217002039

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('nums', nargs=2)

args = parser.parse_args()

print(f'~ Nums {args.nums}')

# Command to run the script
# python 19-07-25\ Argparse\ Number\ of\ Arguments.py 5 2
# python 19-07-25\ Argparse\ Number\ of\ Arguments.py --help

# Notes
# - If you want your parameters to accept a list of items you can specify nargs=n
# - This script a list of that must be at least 2 items long
# - This is a great option
