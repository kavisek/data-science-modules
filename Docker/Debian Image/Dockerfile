# Pull Image from docker hub
FROM debian

# Set working directory
WORKDIR /root


# Install basic linux utitlies
RUN apt-get update
RUN apt-get install sudo  -y
RUN sudo apt-get install curl -y

# Download Conda to "tmp" folder
RUN


# Install Conda

# Copy all of the current dictories content so the docker container
COPY . /root/

# print out all content of what was uploaded to our root folder
RUN ls -la /root/*


# Make port 8080
EXPOSE 8080
