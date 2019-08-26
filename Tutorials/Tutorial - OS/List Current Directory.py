# Import os module
import os

# Get the current directory
cwd_dir = os.listdir()

# List the file in the current working directory
print(f'Current Dirtory {cwd_dir}')


# You can also specify a sub directory
data_subdir = os.listdir('Data')

# Print sub directory file
print(f'Sub Directory: {data_subdir}')
