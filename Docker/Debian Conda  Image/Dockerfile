# Pull Image from docker hub
FROM conda/miniconda3

# Set working directory
WORKDIR /root

# Copy all of the current dicetories content so the docker container
COPY . /root/

# print out the content of what was uploaded to our root folder
RUN ls -la /root/*

# Update Conda
RUN conda update -n base -c defaults conda # Update conda
RUN conda config --add channels conda-forge

# Create Conda Virtual Enviroment
RUN conda create --name airflow python=3.6 -y
# RUN echo "source activate airflow" > ~/.bashrc
# ENV PATH /opt/conda/envs/env/bin:$PATH

# Conda Package Installations
RUN /bin/bash -c "source activate airflow \
  && conda install pandas -y \
  && conda install -c conda-forge gspread -y
  && conda install -c conda-forge jupyterlab -y
  && conda install -c conda-forge gspread -y
  && conda install -c anaconda boto -y
  && conda install -c conda-forge tqdm -y
  && conda install -c annetheagile httplib2 -y
  && conda install -c conda-forge oauth2client -y
  && conda install -c conda-forge python-utils -y
  && conda install mysql-connector-python==2.2.3 -y
  && conda install mysql-connector-c==6.1.6 -y
  && conda install pandas -y
  && conda install airflow=1.10.3 -y
  && conda deactivate"

# Make port 8080
EXPOSE 8080
