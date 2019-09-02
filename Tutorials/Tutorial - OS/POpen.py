import os

# Run popen command via the os module
result = os.popen('ls -l')

# Print the output
print(result.read())
