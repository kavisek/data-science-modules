
# Tutorial Link: https://www.instapaper.com/read/1217002039

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('nums', nargs='*')

args = parser.parse_args()

print(f'~ Nums {args.nums}')

# Command to run the script
# python 19-07-25\ Argparse\ Variable\ Number\ of\ Arguments.py  5 3
# python 19-07-25\ Argparse\ Variable\ Number\ of\ Arguments.py  5 3 45 345 7 56245 13453
# python 19-07-25\ Argparse\ Number\ of\ Arguments.py --help

# Notes
# - If you want your parameters to accept a list of items you can specify nargs=n
# - This script a list of items with no restriction on lengh
# - This is a great option
# - If you want to require, 1 or more parameters, use nargs='+'
# - Since there is not restriction on the list you can pass through an empty list as well with '*'. Use '+' if you want at least one or more arguments
