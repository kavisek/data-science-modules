# Start crontab
service cron start

# Create a new cron file
crontab -l > mycron

# Writing crontab jobs to file
echo "* * * * * /usr/local/envs/main/bin/python /root/minute_logger.py" >> mycron
echo "5 * * * * /usr/local/envs/main/bin/python /root/5_min_logger.py" >> mycron
echo "0 * * * * /usr/local/envs/main/bin/python /root/hourly_logger.py" >> mycron
echo "0 0 * * * /usr/local/envs/main/bin/python /root/daily_logger.py" >> mycron

# Installing file into crontab
crontab mycron

# Remove "mycron" file
rm mycron

# Print current Jobs
echo The following jobs have been scheduled on crontab
crontab -l
sleep 2
