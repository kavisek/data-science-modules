# <center> Crontab Image

This image uses crontab to run 4 python scripts. Each script generates a .txt file as an output. The file is added the logs folder at "/root/logs/[script_name]/" when the script successfully runs.

### Build Docker File

The following commands will help you build a docker container with a conda virtual environment, linux tools, sample python scripts, and a crontab setup script.

```bash
# Navigate to the current directory or cloned repo location
cd /Users/kavi/science/Docker/CronTab\ Image

# Build docker container
docker build -t crontab_image .

# Run the docker container
docker run --name crontab_container -it crontab_image  /bin/bash
```

### Creating and Running our Crontab Jobs

```bash
# Run a bash script to set up our crontab with the jobs
bash setup_crontab.sh
```

Each sample script run at following time intervals.

- Every minute
- Every 5 minutes
- Every hour
- Once a Day at 12 AM

You should the first output from the first crontab job after a minutes within the "root/logs" folder.

If everything works. Congrats, you have a working crontab.

### View Script Outputs

```bash
# List python script outputs
ls /root/logs/minute_logger/* -ltr
```

# <center> Additional Commands for Troubleshooting


### Is Crontab Running?

The following commands will help if you need to start/stop/restart or check status of your crontab.

```bash
sudo service cron start
sudo service cron status
sudo service cron stop
sudo service cron restart
```


### View crontab logs

If you crontab does not run it will log its errors within the following file.

```bash
# View Error contab
cat /var/mail/mail
