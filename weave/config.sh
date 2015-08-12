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
export SERVER_NAME=weave-01
# Hostname of VM running qperf client
export CLIENT_NAME=weave-02
# Name of Docker image to use
export DOCKER_IMAGE=arjanschaaf/centos-qperf
# IP of qperf container using Weave
export QPERF_SERVER_IP=10.128.0.1
# IP of qperf container using Weave
export QPERF_CLIENT_IP=10.128.0.2
