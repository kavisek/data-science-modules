# Given a 32-bit signed integer, reverse digits of an integer


class Solution:
    def reverse(self, x: int) -> int:
        if x >= 0:
            x = str(x)
            x_length = len(x)
            x = x[x_length::-1]
            x = int(x)
            if x > 2**31:
                return 0
            return x
        if x < 0:
            x = str(x)
            x_length = len(x)
            x = x[x_length::-1]
            x = x[:-1]
            x = '-' + x
            x = int(x)
            if x < -(2**31):
                return 0
            return x
