import pandas as pd
import os

# Return a list of path for the current directory
paths = []
path = os.getcwd()
print(path)
# r=root, d=directories, f = files
for root, directories, files in os.walk(path):
    for file in files:
        if '.csv' in file:
            paths.append(os.path.join(root, file))

for path in paths:
    print('\n'*3)
    print('Path:', path)
    df = pd.read_csv(path)
    print('DataFrame Shape', df.shape)
