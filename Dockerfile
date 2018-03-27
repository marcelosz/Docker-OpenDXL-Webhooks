#
# Dockerfile
#
# 2018/03/26 - First release
#
FROM ubuntu:xenial

# Install core components
RUN apt-get update && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get clean
RUN apt-get install -y git python python-pip python-flask python-gunicorn
RUN apt-get clean

# Install application
WORKDIR /opt/
RUN pip install flask_restful
RUN git clone https://github.com/marcelosz/OpenDXL-Webhooks.git
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
