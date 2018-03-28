#
# Dockerfile
#
# 2018/03/26 - First release
#
FROM ubuntu:xenial

# Install core components
RUN apt-get update && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get clean
RUN apt-get install -y git python python-pip wget unzip
RUN apt-get clean

# Install application
WORKDIR /opt/
RUN pip install cherrypy
RUN git clone https://github.com/marcelosz/OpenDXL-Webhooks.git
RUN wget https://github.com/opendxl/opendxl-client-python/releases/download/4.0.0.417/dxlclient-python-sdk-4.0.0.417.zip
RUN unzip dxlclient-python-sdk-4.0.0.417.zip
WORKDIR /opt/dxlclient-python-sdk-4.0.0.417
RUN pip install lib/dxlclient-4.0.0.417.zip
WORKDIR /opt/OpenDXL-Webhooks
ADD run.sh /run.sh
RUN chmod 0755 /run.sh

EXPOSE 8001
ENTRYPOINT ["/run.sh"]
