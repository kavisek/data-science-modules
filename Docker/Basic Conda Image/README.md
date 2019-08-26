# Docker Build and Run

This dockerfile uses the vanilla "conda/miniconda3" docker image which is maintained by the Conda Development Team

#### Image Information

After viewing the images [Dockerfile]((https://hub.docker.com/r/conda/miniconda3/dockerfile) on Docker Hub. I have validate that this is image is built on top of latest version of debian which is the same version of linux that is used on the Google Cloud Platform's Compute Instances.

### Build Docker File

```bash
# Navigate to the current Directory
cd ~/DataScience/Docker/Basic
\ Conda\ Image/

# Build docker container (image name is set to "test_image")
docker build  . -t basic_conda_image

# Run the docker container after the build is complete
# The container is using the "test_image" image
# The container is named "test_container"
docker run --name basic_conda_container -it basic_conda_image  /bin/bash
```
