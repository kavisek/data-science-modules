import subprocess
import sys

# Print python version
# subproccess.run() only work Python 3.5+
print('Python Version:', sys.version)


# Run ls -l command
# This function will run in the home directory
print('\n'*5, '-'*5, 'subprocess run', '-'*5)
subprocess.run(['ls', '-l'])

# Run ls -l command, and view status
print('\n'*5, '-'*5, 'subprocess run - return status \
(capature output)', '-'*5)
x = subprocess.run(['ls', '-l'])
# if the return code is "0" the process succeeded
if x.returncode == 0:
    print('\n'*5, 'Successful')


# Run ls -l command, and return result as variable
print('\n'*5, '-'*5, 'subprocess run - return status \
(capature output)', '-'*5)
x = subprocess.run(['ls', '-l'], stdout=subprocess.PIPE)
# if the return code is "0" the process succeeded
if x.returncode == 0:
    print('\n'*2, 'Successful')
    print('\n'*2, 'Returning Result....')
    data = x.stdout
    print('\n'*2, 'Length of Data', len(data))
    print('\n'*2, 'Print Data', data)
