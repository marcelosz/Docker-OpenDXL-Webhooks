# OpenDXL Webhooks Server - Docker Repository

Introduction
============

This repository contains files related to the OpenDXL Webhooks Server app (https://github.com/marcelosz/OpenDXL-Webhooks). The Docker image can be used as an alternative to installing a Python environment with the modules required for the OpenDXL Webhooks Server.

The remainder of this page walks through the steps required to configure the app, pull an image from the repository and run the app via a Docker container.

Configuration
=============

The first step is to connect to the host that is running Docker and configure the app. All configuration files that are required by the app will reside on the host system and be made available to the Docker container via a data volume.

Once you have logged into the host system, perform the following steps:

1. Create a directory to contain the configuration files (ex.: /opt/webhooks-config)

2. Add the configuration files for the app into that directory. Sample configuration files can be downloaded from https://github.com/marcelosz/OpenDXL-Webhooks/tree/master/conf.

3. Create a directory under 'webhooks-config' called 'dxlconfig'.

4. Copy OpenDXL configuration files into that new directory.

Downloading and Running
===

The next step is to pull the image from the Docker repository. That can be done using the following Docker command:

`docker pull marcelosz/opendxl-webhooks:latest`

After pulling the image, the final step is to create a Docker container. The following Docker command can be used:

`docker run -d --name opendxl-webhooks -p <host-console-port>:8001 -v <host-config-dir>:/opt/OpenDXL-Webhooks/conf marcelosz/opendxl-webhooks:<release-version>

The following parameters must be specified:

host-console-port The port used to access the OpenDXL Console via the host system
host-config-dir The directory on the host that contains the console configuration files
release-version The version of the image (See "Pull Docker Image" section above)

For example:

docker run -d --name dxlconsole -p 8443:8443 -v /home/myuser/dxlconsole-config:/opt/dxlconsole-config opendxl/opendxl-console:0.1.3

Note: A restart policy can be specified via the restart flag (--restart <policy>). This flag can be used to restart the container when the system reboots or if the service terminates abnormally. The unless-stopped policy will restart the container unless it has been explicitly stopped.
