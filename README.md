# OpenDXL Webhooks Server - Docker Repository

Introduction
============

This repository contains files related to the OpenDXL Webhooks Server app (https://github.com/marcelosz/OpenDXL-Webhooks). The Docker image can be used as an alternative to installing a Python environment with the modules required for the OpenDXL Webhooks Server.

The remainder of this page walks through the steps required to configure the app, pull an image from the repository and run the app via a Docker container.

Configuration
=============

The first step is to connect to the host that is running Docker and configure the app. All configuration files that are required by the app will reside on the host system and be made available to the Docker container via a data volume.

Once you have logged into the host system, perform the following steps:

1.) Create a directory to contain the configuration files (ex.: /opt/webhooks-config)

2.) Add the configuration files for the app into that directory. Sample configuration files can be downloaded from https://github.com/marcelosz/OpenDXL-Webhooks/tree/master/conf.

3.) Create a directory under 'webhooks-config' called 'dxlconfig'

4.) Copy OpenDXL configuration files into that new directory

Run
===
docker run -d --name dxlconsole -p <host-console-port>:8443 -v <host-config-dir>:/opt/dxlconsole-config opendxl/opendxl-console:<release-version>
