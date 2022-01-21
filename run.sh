#! /bin/bash

PORT=3003

sudo docker run -t -d \
                -v $(pwd)/cloudomate_scripts:/cloudomate_scripts \
                -p $PORT:3003 \
                --name="c5" \
                thecloudgarage/cloudomate-backend-docker
