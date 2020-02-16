arr = [[1, 1, 1, 0, 0, 0], [0, 1, 0, 0, 0, 0], [1, 1, 1, 0, 0, 0], [
    0, 0, 2, 4, 4, 0], [0, 0, 0, 2, 0, 0], [0, 0, 1, 2, 4, 0]]

print(arr)
print('\n')
print('\n')


def located(arr):
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
    arr = [[1, 1, 1, 0, 0, 0],
           [0, 1, 0, 0, 0, 0],
           [1, 1, 1, 0, 0, 0],
           [0, 0, 2, 4, 4, 0],
           [0, 0, 0, 2, 0, 0],
           [0, 0, 1, 2, 4, 0]]

    max_hourglass_sum = located(arr)
    print(max_hourglass_sum)
