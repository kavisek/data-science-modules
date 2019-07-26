
# Tutorial Link: https://www.instapaper.com/read/1217002039

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--limit',required=True, type=int)

args = parser.parse_args()

if args.limit:
    print(f'limit {args.limit}')

# Command to run the script
# python 19-07-25\ Argparse\ Required\ Flags\ Script.py --limit 4
# python 19-07-25\ Argparse\ Required\ Flags\ Script.py #This fill fail no limit parameter


# Notes
# The 'required=True'  make a flag required or else the script will fail
