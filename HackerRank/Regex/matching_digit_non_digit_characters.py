'''
You have a test string . Your task is to match the pattern
Here  denotes a digit character, and  denotes a non-digit character.

Test 1: 06-11-2015

'''

Regex_Pattern = r"\d\d.\d\d.\d\d\d\d"  # Do not delete 'r'.

import re

print(str(bool(re.search(Regex_Pattern, input()))).lower())
