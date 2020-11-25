FROM ubuntu:18.04
MAINTAINER Thilo Willms <thilo.willms@worldiety.de>

# set default java environment variable
ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=${PATH}:/usr/lib/jvm/default-jvm/bin/

# update data from repositories
RUN apt-get -qq update

# upgrade OS
RUN apt-get -qq dist-upgrade

# install application
RUN apt-get install -yqq redis-server

# install application
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -qq awscli
RUN apt-get install -qq openjdk-8-jdk git

# fix default setting
RUN ln -s java-8-openjdk-amd64 /usr/lib/jvm/default-jvm

# remove apt cache from image
RUN apt-get clean all
