# Docker Build and Run

This dockerfile uses the vanilla "conda/miniconda3" docker image which is maintained by the Conda Development Team

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
