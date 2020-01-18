# Docker Build and RUN

You can build the simple linux docker container using debian by navigating to your DockerFile directory and using the following commands to build your image and the run the container

Feel free to download the Dockerfile within this repo to follow the example below.

```bash
# Navigate to the current Directory
cd ~/Repos/Science/Docker/Basic\ Linux\ Image/

# Build docker container (image name is set to "test_image")
docker build . -t conda_image

# Run the docker container after the build is complete
# The container is using the "test_image" image
# The container is named "test_container
docker run --name conda_container -it conda_image  /bin/bash
```


The last part of output should look similar to the following if everything worked smoothly.

```bash
Preparing transaction: ...working... done
Verifying transaction: ...working... done
Executing transaction: ...working... done
Removing intermediate container 83755a5be9fc
 ---> b3cb448d904f
Step 22/22 : EXPOSE 8080
 ---> Running in 7033fe3374e4
Removing intermediate container 7033fe3374e4
 ---> 7eb97a87c0b2
Successfully built 7eb97a87c0b2
Successfully tagged test_conda_image:latest
```
