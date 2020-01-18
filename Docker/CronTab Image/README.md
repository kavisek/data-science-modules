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

### Is Crontab Running?

```bash
/etc/init.d/cron start
sudo service cron status
sudo service cron stop
sudo service cron start
sudo service cron restart
```

### Creating our Crontab File

```bash
# Create a new cron file
crontab -l > mycron

# Writing crontab jobs to file
echo "5 * * * * /usr/local/envs/main/bin/python /root/5_min_logger.py > /root/5_min_logger.log 2>&" >> mycron
echo "0 * * * * /usr/local/envs/main/bin/python /root/hourly_logger.py > /root/hourly_logger.log 2>&" >> mycron
echo "0 0 * * * /usr/local/envs/main/bin/python /root/daily_logger.py > /root/daily_logger.log 2>&" >> mycron

# Installing crontab file
crontab mycron

# Remove crontab file
rm mycron
```
