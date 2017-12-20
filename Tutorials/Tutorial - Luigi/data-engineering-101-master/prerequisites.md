# Prerequisites

Prior experience with Python and the scientific Python stack is beneficial.  The workshop will focus on using the [Luigi](http://luigi.readthedocs.org/en/latest/index.html) framework, but will have code from the following lobraries as well:

* numpy
* scikit-learn
* Flask

## Setup

For this workshop we will be using [Docker](https://www.docker.com/) to have a consistent environment for all the attendees (and works on most any OS).

### Docker Install

Please follow the instructions [here](http://docker.atbaker.me/exercises/exercise_0.html) to get setup for your particular operating system.

> NOTE: For Windows and Mac you will use [boot2docker](https://github.com/boot2docker/boot2docker) to provide a Linux VM.

After the installation, try running:

```
docker run hello-world
```

And if you see the following it means everything worked:

```
Hello from Docker.
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (Assuming it was not already locally available.)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

For more examples and ideas, visit:
 http://docs.docker.com/userguide/
```
 
### Docker Container Download

You do not need to understand everything about how Docker works, but know that it has a concept of containers.  Think of these as similar to a `virtualenv`, but much more encapsulated.  We will run each of our commands (processes) within a container.  To download the containers with the appropriate libraries:

```
# https://registry.hub.docker.com/u/clearspandex/pydata-seattle/
docker pull clearspandex/pydata-seattle

docker pull sequenceiq/hadoop-docker:2.7.0
docker pull postgres
```

### Software

* Text Editor: I recommend [Sublime Text](http://www.sublimetext.com/2)
* A (modern) Web Browser: I recommend [Google Chrome](https://support.google.com/chrome/answer/95346?hl=en)

## Troubleshooting

If you have any issues with the installations I will go through a quick run through to get people setup at the beginning of the workshop.  Also feel free to reach out to me on email at jondinu@gmail.com (or leave a comment here in the Gist)
