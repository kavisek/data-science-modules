# Pull Image from docker hub
FROM conda/miniconda3

# Set working directory
WORKDIR /root

# Copy all of the current dicetories content so the docker container
COPY . /root/

# print out the content of what was uploaded to our root folder
RUN ls -la /root/*

# Conda Package Installations
RUN conda update -n base -c defaults conda # Update conda
RUN conda config --add channels conda-forge
RUN conda create --name airflow -y
RUN /bin/bash -c "source activate airflow"
RUN conda install -c conda-forge jupyterlab -y
RUN conda install -c conda-forge gspread -y
RUN conda install -c anaconda boto -y
RUN conda install -c conda-forge tqdm -y
RUN conda install -c annetheagile httplib2 -y
RUN conda install -c conda-forge oauth2client -y
RUN conda install -c conda-forge python-utils -y
RUN conda install mysql-connector-python==2.2.3 -y
RUN conda install mysql-connector-c==6.1.6 -y
RUN conda install pandas -y
RUN conda install airflow=1.10.3 -y

# Make port 8080
EXPOSE 8080
