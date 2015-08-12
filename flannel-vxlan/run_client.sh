#!/bin/bash
#set -x

# Source configuration file
source config.sh

# Get IP of Docker container running qperf-server
QPERF_SERVER_IP=$(vagrant ssh ${SERVER_NAME} -c "docker inspect --format '{{ .NetworkSettings.IPAddress }}' qperf-server" | sed 's/\(.*\)\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)\(.*\)/\1\2/g')

# Remove any existing Docker container called qperf-client
vagrant ssh ${CLIENT_NAME} -c "docker rm -f qperf-client"

# Run qperf in qperf-client container
for i in $(seq 1 10); do
 	vagrant ssh ${CLIENT_NAME} -c "docker run --rm --name qperf-client ${DOCKER_IMAGE} -lp ${HOST_LISTEN_PORT} -ip ${HOST_IP_PORT} ${QPERF_SERVER_IP} tcp_bw tcp_lat"
done
