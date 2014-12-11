jenkdockchefsolo
================

Test chef-solo jenkins dependencies for custom tests

# install docker on your host (e.g. boot2docker if Mac)

# start it up
boot2docker up

# get base ubuntu image
docker pull ubuntu:12.04

#clone this repo, cd into base, run
docker build .
