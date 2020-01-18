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
