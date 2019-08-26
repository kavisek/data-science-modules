# Import os module
import os

# Return a list of path for the current directory
file_paths = []
path = os.getcwd()+'/Data'
# r=root, d=directories, f = files
for root, directories, files in os.walk(path):
    for file in files:
        if '.txt' in file:
            file_paths.append(os.path.join(root, file))

# Print the file paths
for file_path in file_paths:
    print(f'File Path {file_path}')
