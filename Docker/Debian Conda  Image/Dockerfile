# Pull Image from docker hub
FROM conda/miniconda3

# Set working directory
WORKDIR /root

# Copy all of the current dicetories content so the docker container
COPY . /root/

# print out the content of what was uploaded to our root folder
RUN ls -la /root/*

# Make port 8080
EXPOSE 8080
