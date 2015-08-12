#!/bin/bash
#set -x

# Source configuration file
source config.sh

# Remove any Docker container named qperf-server
vagrant ssh ${SERVER_NAME} -c "docker rm -f qperf-server"

# Start Docker container running qperf server
vagrant ssh ${SERVER_NAME} -c "docker run -dti --name qperf-server -p ${CONTAINER_LISTEN_PORT} -p ${CONTAINER_IP_PORT} ${DOCKER_IMAGE} -lp ${CONTAINER_LISTEN_PORT}"
