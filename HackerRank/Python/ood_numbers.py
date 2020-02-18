#!/bin/python3

import math
import os
import random
import re
import sys


#
# Complete the 'oddNumbers' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER l
#  2. INTEGER r
#

def oddNumbers(l, r):
    # Write your code here
    lst = list(range(l, r+1))
    odd_numbers = []
    for i in lst:

        if i % 2 == 1:
            odd_numbers.append(i)

    return odd_numbers


if __name__ == '__main__':
