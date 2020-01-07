###  AWS Command line Cheat Sheet




### Insatlling AWSCLI wth Conda



```bash
conda create --name aws
source activate aws
conda install -c conda-forge awscli
aws --version
aws configure
```
Enter Secret Key ID and and Secret Access Key

### View Authorizations Details

```bash
# Get aws authorization details
aws iam  get-account-authorization-detail
```


### View S3 buckets

```bash
# View available s3 buckets
aws s3 ls
```

### View DMS Tasks

```bash
# view the dms tasks
aws dms describe-replication-tasks

# Modify dms task with new task setting for debugging
aws dms modify-replication-task --replication-task-arn arn:aws:dms:us-west-2:979221706071:task:SOSINVHS7REGHLBGZWRUKPAKJU --replication-task-settings file://default_dms_task_settings_with_logging.json
```
