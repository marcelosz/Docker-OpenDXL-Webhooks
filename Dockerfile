#
# Dockerfile
#
# 2018/03/26 - First release
#
FROM ubuntu:xenial
MAINTAINER Marcelo de Souza <marcelo_souza@mcafee.com>

# Install core components
RUN apt-get update && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get clean
#RUN apt-get install -y mysql-client curl gcc git gnupg-agent make python openssl redis-server sudo vim zip locales
RUN apt-get install -y git python
RUN apt-get clean

# Install application
WORKDIR /opt/
RUN git clone https://github.com/marcelosz/REST2OpenDXL.git
ADD run.sh /run.sh
RUN chmod 0755 /run.sh

# Trigger to perform first boot operations
RUN touch /.firstboot.tmp
# Make a backup of /var/www/MISP to restore it to the local moint point at first boot
#WORKDIR /var/www/MISP
#RUN tar czpf /root/MISP.tgz .
#VOLUME /var/www/MISP
EXPOSE 8001
ENTRYPOINT ["/run.sh"]
