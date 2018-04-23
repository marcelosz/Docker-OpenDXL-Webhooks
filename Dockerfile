#
# Dockerfile
#
# 2018/03/26 - First release
# 2018/04/06 - Minor changes
# 2018/04/23 - Major changes (now using Alpine as base image)
#
FROM alpine:3.7

# Install core components
RUN apk add --update \
    bash \
    python \
    python-dev \
    py-pip \
    build-base \
    git \
  && pip install --upgrade pip \
  && rm -rf /var/cache/apk/*

# Install application
WORKDIR /opt/
RUN pip install cherrypy
RUN wget https://github.com/marcelosz/OpenDXL-Webhooks/releases/download/v1.0-beta.1/OpenDXL-Webhooks-1.0-beta.1.zip \
    && unzip OpenDXL-Webhooks-1.0-beta.1.zip \ 
    && mv OpenDXL-Webhooks-1.0-beta.1 OpenDXL-Webhooks
RUN wget https://github.com/opendxl/opendxl-client-python/releases/download/4.0.0.417/dxlclient-python-sdk-4.0.0.417.zip \
    && unzip dxlclient-python-sdk-4.0.0.417.zip
WORKDIR /opt/dxlclient-python-sdk-4.0.0.417
RUN pip install lib/dxlclient-4.0.0.417.zip
WORKDIR /opt/OpenDXL-Webhooks
RUN git clone https://github.com/marcelosz/opendxl_util.git
ADD run.sh /run.sh
RUN chmod 0755 /run.sh

EXPOSE 8001
VOLUME /opt/OpenDXL-Webhooks/conf

ENTRYPOINT ["/run.sh"]
