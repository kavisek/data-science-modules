# Pull Amazond Linux2 image
FROM amazonlinux

# Set working directory
WORKDIR /root

# Print linux version
RUN cat /etc/os-release

RUN yum update -y
RUN yum install wget -y
RUN wget https://downloads.tableau.com/esdalt/2019.4.1/tableau-server-2019-4-1.x86_64.rpm
RUN yum install tableau-server-2019-4-1.x86_64.rpm
RUN cd /opt/tableau/tableau_server/packages/scripts.20194.19.1211.1636


RUN adduser kavi3 -G root -p qwfpg12345
RUN su kavi
RUN sudo ./initialize-tsm --accepteula -a daemon
