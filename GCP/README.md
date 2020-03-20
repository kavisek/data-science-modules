## GCP Command Line Guide


### Authentication

```bash
# Update gcloud command line interface
gcloud components update

#List authentications accounts
gcloud auth list

#Authenticate docker
gcloud auth configure-docker

#Print access token
gcloud auth print-access-token

#Print identity token
gcloud auth print-identity-token

# List project you have access to
gcloud projects list

# Change project
gcloud config set project [project-id]

# View current project
gcloud config get-value project
```

### Google Storage Commands

```bash
# list buckets
gsutil ls

# Turn on version on Google bucket
gsutil versioning set on [bucket_path]

# Check is versioning is enabled
gsutil versioning get [bucket_path]

# list file of versioned bucket. Each version file will have generation ID
# The higher the generation number the higher more recent the file is.
gsutil ls -a [bucket_path]
```
