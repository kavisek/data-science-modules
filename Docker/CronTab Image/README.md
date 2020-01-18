# <center> Crontab Image

This image deals with setting up a crontab with our conda image. We will be setting the crontab in the linux container and running python script on regular interval. Each script will have its own virtual environment.

### Build Docker File

```bash
# Navigate to the current Directory
cd /Users/kavi/science/Docker/CronTab\ Image

# Build docker container
docker build -t crontab_image .

# Run the docker container
docker run --name crontab_container -it crontab_image  /bin/bash


```
