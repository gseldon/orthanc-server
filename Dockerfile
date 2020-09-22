#FROM osimis/orthanc
FROM osimis/orthanc:19.11.2

ENV HTTP_BUNDLE_DEFAULTS=false
ENV LISTENER_BUNDLE_DEFAULTS=false
ENV PLUGINS_BUNDLE_DEFAULTS=false
ENV STORAGE_BUNDLE_DEFAULTS=false
ENV AC_BUNDLE_DEFAULTS=false

ADD ./app/plugins /usr/share/orthanc/plugins
#ADD ./app/lib/ /usr/share/lib

RUN apt-get update && apt-get install -qy libssl-dev
RUN mv /usr/share/orthanc/plugins-disabled/libOsimisWebViewer.so /usr/share/orthanc/plugins
RUN mv /usr/share/orthanc/plugins-disabled/libOrthancPostgreSQLIndex.so /usr/share/orthanc/plugins
RUN mv /usr/share/orthanc/plugins-disabled/libOrthancPostgreSQLStorage.so /usr/share/orthanc/plugins