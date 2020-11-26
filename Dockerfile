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
RUN apt-get install -qq  git

# install java and update JAVA_HOME variable
RUN apt-get install -y default-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/bin/java

# remove apt cache from image
RUN apt-get clean all
