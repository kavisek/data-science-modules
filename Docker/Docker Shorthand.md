# <center> Docker Shorthand </center>

### Images Managment

```bash

# pull down two docker images
docker pull debian
docker pull mysql/mysql-server

# View  images
docker images

# remove all dangling images, volumes, and networks not associated  with a container
docker system prune

# remove all unused images, volumes, and networks not associated  with a container
docker system prune -a

# view images (the results of the pruning)
docker images

# remove one image
docker debian mysql/mysql-server

# remove multiple image
docker rmi debian mysql/mysql-server
```


### The Basics

```bash
# Stop docker container
docker stop tommy

# Start docker container
docker start tommy

# Reattached to started docker container
docker attach tommy
```

### Container Managments

```bash




````

### Saving and Loading Containers

```bash
# Save container's image
docker export debian > debian_save.tar

# Save container data
docker export tommy  > tommy_export.tar

# Remove the activate container
docker stop tommy
docker rm tommy

# load image
docker load < debian_save.tar

# Import image data (with a new tag)
cat tommy_export.tar | docker import - debian:new

docker run --name douglas -it debian:new /bin/bash
```

### References

- https://docs.docker.com/engine/reference/commandline/import/
