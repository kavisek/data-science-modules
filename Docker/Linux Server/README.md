# Docker Build and RUN

You can build the docker container by navigating to your DockerFile directory and using the following commands to build your image and the run the container

```bash
# Navigate to the current Directory
cd ~/Repo/Science/Docker/Linux\ Server

# Build docker container (image name is set to "test_image")
docker build -t test_image .

# Run the docker container after the build is complete
# The container is using the "test_image" image
# The container is named "tommy"
docker run --name tommy -it test_image  /bin/bash
```
