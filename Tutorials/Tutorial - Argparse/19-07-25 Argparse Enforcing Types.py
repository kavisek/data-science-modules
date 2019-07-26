
# Tutorial Link: https://www.instapaper.com/read/1217002039

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--geo', nargs=2, type=int)
parser.add_argument('--pos', nargs=2, type=int)
parser.add_argument('type', type=string)

args = parser.parse_args()

print(f'~ Geo {args.geo}')
print(f'~ Pos {args.pos}')
print(f'~ Type {args.type}')

# Command to run the script
# python 19-07-25\ Argparse\ Flags\ and\ Positional\ Arguments.py --geo 5 10 --pos 2 55 square

# Notes
# - Bringing positoinal and flag based arguments together.
