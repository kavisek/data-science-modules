'''
You have a test string . Your task is to match the pattern
Here,  denotes whitespace characters, and  denotes non-white space character

Test 1: 06-11-2015

'''

Regex_Pattern = r"\S\S\s\S\S\s\S\S"  # Do not delete 'r'.

import re

print(str(bool(re.search(Regex_Pattern, input()))).lower())
