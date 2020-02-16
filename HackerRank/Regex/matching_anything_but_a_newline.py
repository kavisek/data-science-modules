'''
You have a test string . Your task is to write a regular expression that matches only and exactly strings of form: , where each variable  can be any single character except the newline.

Test 1: 123.456.abc.def
Test 2: 1123.456.abc.def

'''

regex_pattern = r"...\....\....\....$"  # Do not delete 'r'.

import re
import sys

test_string = input()

match = re.match(regex_pattern, test_string) is not None

print(str(match).lower())
