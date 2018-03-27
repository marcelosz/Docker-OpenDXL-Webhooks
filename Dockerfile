#
# Dockerfile
#
# 2018/03/26 - First release
#
FROM ubuntu:xenial

# Install core components
RUN apt-get update && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get clean
RUN apt-get install -y git python python-pip
RUN apt-get clean

# Install application
WORKDIR /opt/
RUN pip install cherrypy
RUN git clone https://github.com/marcelosz/OpenDXL-Webhooks.git
ADD run.sh /run.sh
RUN chmod 0755 /run.sh

EXPOSE 8001
ENTRYPOINT ["/run.sh"]
