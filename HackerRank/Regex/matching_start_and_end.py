'''
You have a test string . Your task is to match the pattern
Here,  denotes a word character, and  denotes a digit.
 must start with a digit  and end with . symbol.
 should be  characters long only.

Test 1: www.hackerrank.com

'''

Regex_Pattern = r"^\d{1}\w{4}[.]{1}$"  # Do not delete 'r'.

import re

print(str(bool(re.search(Regex_Pattern, input()))).lower())
