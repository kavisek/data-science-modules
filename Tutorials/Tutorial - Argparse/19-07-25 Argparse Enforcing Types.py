
# Tutorial Link: https://www.instapaper.com/read/1217002039

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--geo', nargs=2, type=int)
parser.add_argument('--pos', nargs=2, type=int)
parser.add_argument('filename', type=argparse.FileType('r')) #Readable File

args = parser.parse_args()

print(f'~ Geo {args.geo}')
print(f'~ Pos {args.pos}')
print(f'~ File Type {args.filename} \n') #File Name is contained with the File Type

# Print out file contents
for line in args.filename:
    print( line.strip() )

# Command to run the script
# python 19-07-25\ Argparse\ Enforcing\ Types.py --geo 5 10 --pos 2 55 text.txt

# Notes
# - Bringing positoinal and flag based arguments together.
# - You can specify type by setting the type pararmeter to int =
# -The 'argparse.FileType('r')' is use when reading a file
