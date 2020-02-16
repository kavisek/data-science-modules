#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the hourglassSum function below.


def hourglassSum(arr):
    x = len(arr)  # Length of arr
    y = len(arr[0])  # Width of arr

    sums = []
    for i, j in enumerate(arr):
        for k, l in enumerate(arr):
            if (i > x-3) or (k > y-3):
                break

            sums.append(arr[i][k]
                        + arr[i][k+1]
                        + arr[i][k+2]
                        + arr[i+1][k+1]
                        + arr[i+2][k]
                        + arr[i+2][k+1]
                        + arr[i+2][k+2])
    return max(sums)


if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    arr = []

    for _ in range(6):
        arr.append(list(map(int, input().rstrip().split())))

    result = hourglassSum(arr)

    fptr.write(str(result) + '\n')

    fptr.close()
