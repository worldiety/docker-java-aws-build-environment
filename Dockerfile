FROM ubuntu:18.04
MAINTAINER Julian Kahnert <julian.kahnert@worldiety.de>


# set default java environment variable
ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=${PATH}:/usr/lib/jvm/default-jvm/bin/

# update data from repositories
RUN apt-get -qq update

# upgrade OS
RUN apt-get -qq dist-upgrade

# install application
RUN apt-get install -qq awscli

# install application
RUN apt-get install -qq openjdk-8-jdk git mariadb-server 

# fix default setting
RUN ln -s java-8-openjdk-amd64  /usr/lib/jvm/default-jvm

# remove apt cache from image
RUN apt-get clean all
