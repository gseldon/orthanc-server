#FROM osimis/orthanc
FROM osimis/orthanc

ADD ./app/plugins/ /usr/share/orthanc/plugins
#ADD ./app/lib/ /usr/share/lib

RUN apt-get update && apt-get install -y g++