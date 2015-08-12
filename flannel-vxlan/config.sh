#!/bin/bash

# Port to listen on host 
export HOST_LISTEN_PORT=5000
# Port ot listen on qperf server container
export CONTAINER_LISTEN_PORT=5000
# Port to connect on host
export HOST_IP_PORT=5001
# Port to connect on qperf server container
export CONTAINER_IP_PORT=5001
# Hostname of VM running qperf server
export SERVER_NAME=flannel-vxlan-01
# Hostname of VM running qperf client
export CLIENT_NAME=flannel-vxlan-02
# Name of Docker image to use
export DOCKER_IMAGE=arjanschaaf/centos-qperf
