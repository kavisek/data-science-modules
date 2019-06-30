# <center> Docker Shorthand </center>

![](Images/docker_image.png)

This a consolidation docker command and docker note created by the community.

Reference can be sound at the bottom of the page.

### Image Management

```bash
# Pull down two docker images
docker pull debian
docker pull mysql/mysql-server

# View  images
docker images

# Remove all dangling images, volumes, and networks not associated  with a container
docker system prune

# Remove all unused images, volumes, and networks not associated  with a container
docker system prune -a

# View images (the results of the pruning)
docker images

# Remove one image
docker debian mysql/mysql-server

# Remove multiple image
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

### Container Managment

```bash
# View active docker containers
docker ps

# View all docker containers
docker ps -a

# Remove a docker container
docker rm tommy

# Remove more than one docker containe
docker rm tommy jeremy
```

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
- https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
