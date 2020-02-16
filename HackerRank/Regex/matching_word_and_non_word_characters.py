'''
You have a test string . Your task is to match the pattern
Here  denotes any word character and  denotes any non-word character.

Test 1: www.hackerrank.com

'''

Regex_Pattern = r"\w\w\w\W\w\w\w\w\w\w\w\w\w\w\W\w\w\w"  # Do not delete 'r'.

import re

print(str(bool(re.search(Regex_Pattern, input()))).lower())
