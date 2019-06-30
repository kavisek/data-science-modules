### <center> Docker Setup - Linux Debian Server

This markdown file contains brief instruction on how to set a linux container with conda and a few our dependancies that I find useful.

I had written my note using [iTerm2](https://www.iterm2.com/) on Mac. A better application then the default terminal application on mac. If your are using [Atom](https://atom.io/), your opent terminal in your editior with the command

### Install docker container
```bash
# Pull docker image  
docker pull debian

# Set up the docker container
docker run --name tommy -it debian /bin bash

# Stop docker container  
docker stop tommy

# Start docker container  
docker start tommy

# Reattached to started docker container  
docker attached tommy

# Check Debian version, the output should be a float (i.e. 9.9)
cat /etc/debian_version
```


### Installing Linux Utilies
```bash
# Update Package Cache
apt-get update

# Install Sudo
apt-get install sudo
```

#### Nano
```bash
# Install nano
sudo apt-get install nano

# Test that nano is installed
nano --help
```

#### CURL
```bash
# Install Curl
sudo apt-get install curl

# Test that Curl was installed
curl --version
```

### Git
```bash
# Install Git
sudo apt install git

# Check git version
git --version
```


### WGet
```bash
# Install the wget tool
sudo apt-get install wget
```

### Bzip2
```bash
apt-get install bzip2
```

### Conda
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
