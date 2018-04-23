# OpenDXL Webhooks Server - Docker Repository

Introduction
---------------------

This repository contains files related to the OpenDXL Webhooks Server (https://github.com/marcelosz/OpenDXL-Webhooks). The Docker image can be used as an alternative to installing a Python environment with the modules required for the OpenDXL Webhooks Server.

The remainder of this page walks through the steps required to configure the app, pull the image from the repository, and run the app via a Docker container.

Configuration
===

TODO

Run
===
docker run -d --name dxlconsole -p <host-console-port>:8443 -v <host-config-dir>:/opt/dxlconsole-config opendxl/opendxl-console:<release-version>
