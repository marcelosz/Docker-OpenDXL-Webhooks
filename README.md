# OpenDXL Webhooks Docker Image

Introduction
---------------------

This pre-built Docker image can be used as an alternative to installing a Python environment with the modules required for the OpenDXL Webhooks server. The image is based on the following Dockerfile repository: 

`<https://github.com/marcelosz/Docker-OpenDXL-Webhooks>`

The remainder of this page walks through the steps required to configure the app, pull the image from the repository, and run the app via a Docker container.

Configuration
===

TODO

Run
===
docker run -d --name dxlconsole -p <host-console-port>:8443 -v <host-config-dir>:/opt/dxlconsole-config opendxl/opendxl-console:<release-version>
