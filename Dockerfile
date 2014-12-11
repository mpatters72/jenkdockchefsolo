# Comment
FROM ubuntu:12.04
MAINTAINER "Mike Patterson"
RUN ["echo",  "Staring Jenkins Slave Build"]

## chef-client install
RUN ["echo",  "installing chef-client"]
# env variable to prevent error message on curl install
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
    apt-utils \
    curl \
    wget \
    git

RUN curl -L https://www.opscode.com/chef/install.sh | bash
RUN chef-client -v
###

### copy in chef-solo files ###
# mounting local file systems with boot2docker on osx http://stackoverflow.com/questions/26348353/mount-volume-to-docker-image-on-osx
# need boot2docker 1.3.0 or later
# boot2docker stop
# VBoxManage sharedfolder add boot2docker-vm --name /Users --hostpath /Users
# boot2docker ssh "sudo mount -t vboxsf -o uid=1000,gid=50 /Users /Users"
# docker run -v /Users/mike/git/jenkins-chef/jenkdockchefsolo:/jenkdockchefsolo ubuntu:12.04 cat /jenkdockchefsolo/readme.txt
# docker doesn't let you mount during build phase :-(
###

RUN git clone git@github.com:mpatters72/jenkdockchefsolo.git
RUN ls jenkdockchefsolo.git

