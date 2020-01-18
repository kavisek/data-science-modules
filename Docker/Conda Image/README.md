# Docker Build and Run

This dockerfile uses the vanilla "conda/miniconda3" docker image which is maintained by the Conda Development Team

#### Image Information

After viewing the images [Dockerfile]((https://hub.docker.com/r/conda/miniconda3/dockerfile) on Docker Hub. I have validate that this is image is built on top of latest version of debian which is the same version of linux that is used on the Google Cloud Platform's Compute Instances.

```bash
FROM debian:latest
MAINTAINER Conda Development Team <conda@continuum.io>

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes

ENV PATH /opt/conda/bin:$PATH
```

### Build Docker File

```bash
# Navigate to the current Directory
cd ~/Repos/Science/Docker/Debian\ Conda\ Image/

# Build docker container (image name is set to "test_image")
docker build -t test_image .

# Run the docker container after the build is complete
# The container is using the "test_image" image
# The container is named "test_container"
docker run --name test_container -it test_image  /bin/bash
```

Sources

- https://hub.docker.com/r/conda/miniconda3/dockerfile
- https://stackoverflow.com/questions/20635472/using-the-run-instruction-in-a-dockerfile-with-source-does-not-work
- https://medium.com/@chadlagore/conda-environments-with-docker-82cdc9d25754
- https://stackoverflow.com/questions/55123637/activate-conda-environment-in-docker
