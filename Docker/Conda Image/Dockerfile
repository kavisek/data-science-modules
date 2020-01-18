# Pull Image from docker hub
FROM conda/miniconda3

# Set working directory
WORKDIR /root

# Copying File to Room Directory
COPY . /root/

# Install Linux Packages
RUN apt-get update
RUN apt-get install sudo  -y
RUN sudo apt-get install bzip2
RUN sudo apt-get install curl -y
RUN sudo apt-get install wget
RUN sudo apt install screen -y
RUN sudo apt-get install postgresql postgresql-contrib -y
RUN sudo apt install nano
RUN sudo apt-get install screen
RUN sudo apt-get install lsof
RUN sudo apt install git -y

# Install MYSQL Command Line client
RUN apt-get install -y mysql-client
RUN apt-get install -y libzbar-dev
RUN sudo apt-get install libmariadbclient-dev

# Update Conda
RUN conda update -n base -c defaults conda
RUN conda config --add channels conda-forge

# Create Conda Virtual Enviroment
RUN conda create --name main python=3.6 -y

# Conda Package Installations
 RUN /bin/bash -c "source activate main \
  && conda install pandas -y \
  && conda install -c conda-forge gspread -y \
  && conda install -c conda-forge jupyterlab -y \
  && conda install -c conda-forge gspread -y \
  && conda install -c anaconda boto -y \
  && conda install -c conda-forge tqdm -y \
  && conda install -c annetheagile httplib2 -y \
  && conda install -c conda-forge oauth2client -y \
  && conda install -c conda-forge python-utils -y \
  && conda install mysql-connector-python==2.2.3 -y \
  && conda install mysql-connector-c==6.1.6 -y \
  && conda deactivate"

# Make port 8080
EXPOSE 8080
