#! /bin/bash



# docker image to build
IMAGE_NAME=thecloudgarage/cloudomate-backend-docker

# build image
sudo docker build -t $IMAGE_NAME .
