# Import os module
import os
import time

# Will create a subdirectory called data2
# If a subdirectory already exists then the method will return a FileExitsError
print('Creating file...')
os.mkdir('Data2')

# Sleep for 10 second_task
print('Sleeping...')
time.sleep(10)


# Remove the directory
# If the directory did not exist in the first place the following method
# will continue on, it will not through an error
print('Removing directory...')
os.rmdir('Data2')
