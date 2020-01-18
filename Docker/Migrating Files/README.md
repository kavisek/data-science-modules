# Copying files to a Docker Image

This docker image and container is an example of how you can copy files from
your local machine to a docker image and access your file when you run your
container.

### Instructions

Run the docker container using the following docker command.

```bash
# Docker build
docker build -t copy_image .
```

Use the following command to run the docker container

```bash
# Run docker container
docker run -d -P --name copy_container -it copy_image /bin/bash

# Attach to the docker container
docker attach copy_container

# Type `exit` if you want to exit the docker container
exit
```

Use the following commands to remove the container and images

```bash
# Remove the container and image
docker rm copy_container
docker rmi copy_image
```
