FROM ubuntu:18.04
MAINTAINER Julian Kahnert <julian.kahnert@worldiety.de>


# set default java environment variable
ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=${PATH}:/usr/lib/jvm/default-jvm/bin/


# update data from repositories
RUN apt-get update

# upgrade OS
RUN apt-get -y dist-upgrade

# install application
RUN apt-get install -y --no-install-recommends openjdk-8-jre git awscli mariadb-server 

# fix default setting
RUN ln -s java-8-openjdk-amd64  /usr/lib/jvm/default-jvm

# remove apt cache from image
RUN apt-get clean all
