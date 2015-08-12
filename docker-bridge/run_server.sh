#!/bin/bash
#set -x

# Source configuration file
source config.sh

# Remove any Docker container named qperf-server
vagrant ssh ${SERVER_NAME} -c "docker rm -f qperf-server"

# Start Docker container running qperf server
vagrant ssh ${SERVER_NAME} -c "source /etc/environment && docker run -dti --name qperf-server -p \${COREOS_PUBLIC_IPV4}:${HOST_LISTEN_PORT}:${CONTAINER_LISTEN_PORT} -p \${COREOS_PUBLIC_IPV4}:${HOST_IP_PORT}:${CONTAINER_IP_PORT} ${DOCKER_IMAGE} -lp ${CONTAINER_LISTEN_PORT}"
