#! /bin/bash

PORT=3003
containerversion=v1

sudo docker run -t -d \
                -v $(pwd)/cloudomate_scripts:/cloudomate_scripts \
                -p $PORT:3003 \
                --name="cloudomate$containerversion" \
                thecloudgarage/cloudomate-backend-docker
