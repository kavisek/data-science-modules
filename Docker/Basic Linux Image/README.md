# Docker Build and RUN

You can build the simple linux docker container using debian by navigating to your DockerFile directory and using the following commands to build your image and the run the container

Feel free to download the Dockerfile within this repo to follow the example below.

```bash
# Navigate to the current Directory
cd ~/Repos/Science/Docker/Basic\ Linux\ Image/

# Build docker container (image name is set to "test_image")
docker build -t test_image .

# Run the docker container after the build is complete
# The container is using the "test_image" image
# The container is named "tommy"
docker run --name tommy -it test_image  /bin/bash
```


The output should look similar to the following if everything worked smoothly.

```bash
Sending build context to Docker daemon  6.656kB
Step 1/5 : FROM debian
 ---> e1de74e67cc7
Step 2/5 : WORKDIR /root
 ---> Running in 5230fac70e8e
Removing intermediate container 5230fac70e8e
 ---> a45025dbb8df
Step 3/5 : COPY . /root/
 ---> 3f0a7fe6678a
Step 4/5 : RUN ls -la /root/*
 ---> Running in 77642a1a7ff9
-rw-r--r-- 1 root root  278 Jul 11 09:56 /root/Dockerfile
-rw-r--r-- 1 root root  547 Jul 11 09:57 /root/README.md
-rw-r--r-- 1 root root 2153 Jul 11 09:42 /root/sample.txt
Removing intermediate container 77642a1a7ff9
 ---> 3c7194008e46
Step 5/5 : EXPOSE 8080
 ---> Running in e77c3b6f7725
Removing intermediate container e77c3b6f7725
 ---> 8a21692efadd
Successfully built 8a21692efadd
Successfully tagged test_image:latest
```
