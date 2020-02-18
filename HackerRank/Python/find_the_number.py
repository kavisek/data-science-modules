#!/bin/python3

import math
import os
import random
import re
import sys


#
# Complete the 'findNumber' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. INTEGER_ARRAY arr
#  2. INTEGER k
#

def findNumber(arr, k):
    # Write your code here
    if len(arr) > 0:
        if k in arr:
            return 'YES'
        else:
            return 'NO'
    else:
        return 'NO'


if __name__ == '__main__':
