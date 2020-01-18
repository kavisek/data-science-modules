### <center> Docker Setup - Linux Debian Server

This markdown file contains brief instruction on how to set a linux container with conda and a few our dependancies that I find useful.

I had written my note using [iTerm2](https://www.iterm2.com/) on Mac. A better application then the default terminal application on mac. If your are using [Atom](https://atom.io/), your opent terminal in your editior with the command

To use this tutorial you will need in install [Docker Desktop](https://www.docker.com/products/docker-desktop) and sign into Docker with after install the software.

### Install docker container

```bash
# Pull docker image  
docker pull debian

# Set up the docker container
docker run --name tommy -it debian /bin/bash

# Check Debian version, the output should be a float (i.e. 9.9)
cat /etc/debian_version

# Exit Container
exit

# Stop docker container
docker stop tommy

# Start docker container
docker start tommy

# Reattach to started docker container
docker attach tommy

# Reattach to the started docker container
docker exec -it tommy  /bin/bash
```


### Installing Linux Utilies
```bash
# Update Package Cache
apt-get update

# Install Sudo
apt-get install sudo

# Test that sudo is installed
sudo --version
```

#### Nano

Modeless text editor
```bash
# Install nano
sudo apt-get install nano

# Test that nano is installed
nano --version
```

#### CURL

CURL is a command line tool for transferring data, released in 1997.
```bash
# Install Curl
sudo apt-get install curl

# Test that Curl was installed
curl --version
```

### Git

Version control software for tracking changes to code and files, released in April 2005.

```bash
# Install Git
sudo apt install git

# Check git version
git --version
```


### WGet

Free software that retrieves files using HTTP, HTTPS, FTP and FTPS protocols, released in January 1996

```bash
# Install the wget tool
sudo apt-get install wget
```

### Bzip2
Open-source compression program, released in September 2010.
```bash
apt-get install bzip2
```

### Conda
An open source package and enviroment management system, released in July, 2012
```bash
# Navigate to tmp folder
cd /tmp

# Download anaconda with a Curl request
curl -O https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh

# Install package/bash script via bash
bash Anaconda3-5.0.1-Linux-x86_64.sh

# Activate the installation
source ~/.bashrc

# test that conda installation worked
conda --version
```
