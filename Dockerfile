FROM    python:2

# install dependencies
RUN     apt-get update \
        && apt-get install --no-install-recommends -y wget curl unzip iputils-ping git


RUN     pip install cloudomate-thecloudgarage-0.2

ENV     PORT=3003
EXPOSE  $PORT

VOLUME  ["/cloudomate_scripts"]

CMD     cloudomate --dir /cloudomate_scripts --port=$PORT
