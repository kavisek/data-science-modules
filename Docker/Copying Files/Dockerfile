# Pull Image from docker hub
FROM conda/miniconda3


# Make directories if the don't exist and copy key files from local machine
RUN mkdir -p /root/keys/sample

# Set working directory
WORKDIR /root

# Copy all of the current dicetories files to the docker container.
COPY . /root/

# Note: you cannot copy files from a parent directory, only the directory which
# contains the docker file of subdirectories of the current directory working
# directory.
