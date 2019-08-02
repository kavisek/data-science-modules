
# Tutorial Link: https://www.instapaper.com/read/1217002039

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('filename')
parser.add_argument('nums', nargs='*')

args = parser.parse_args()

print(f'~ FileName {args.filename}')
print(f'~ Nums {args.nums}')

# Command to run the script
# python 19-07-25\ Argparse\ File\ and\ List\ of\ Arguments.py text.txt 1 34 5 6 6
# python 19-07-25\ Argparse\ File\ and\ List\ of\ Arguments.py text.txt

# Notes
# - If you wanted an argument with file name a list of strings
# - Since there is not restriction on the list you can pass through an empty list as well with '*'. Use '+' if you want at least one or more arguments
# - You can also specify nargs='?' if you want to make a positional argument optional, but you need to be careful how you combine ? and * parameters, especially if you put an optional positional parameter before another one.
# - Read more about possible conflicts at: https://www.instapaper.com/read/1217002039
