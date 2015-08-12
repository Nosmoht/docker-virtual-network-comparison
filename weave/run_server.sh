#!/bin/bash
#set -x

# Source configuration file
source config.sh

# Start Docker container running Weave
vagrant ssh ${SERVER_NAME} -c "sudo weave launch"

# Remove any Docker container named qperf-server
vagrant ssh ${SERVER_NAME} -c "docker rm -f qperf-server"

# Start Docker container running qperf server
vagrant ssh ${SERVER_NAME} -c "sudo weave run ${QPERF_SERVER_IP}/10 -dti --name qperf-server ${DOCKER_IMAGE} -lp ${CONTAINER_LISTEN_PORT}"
