#!/bin/bash
#set -x

# Source configuration file
source config.sh

# Start Weave
vagrant ssh ${CLIENT_NAME} -c "sudo weave launch ${SERVER_IP}"

# Remove any existing Docker container called qperf-client
vagrant ssh ${CLIENT_NAME} -c "docker rm -f qperf-client"

# Start Docker container running qperf client
vagrant ssh ${CLIENT_NAME} -c "sudo weave run ${QPERF_CLIENT_IP}/10 --name qperf-client ${DOCKER_IMAGE}"

# Run qperf in qperf-client container
for i in $(seq 1 10); do
 	vagrant ssh ${CLIENT_NAME} -c "docker exec -ti qperf-client qperf -lp ${HOST_LISTEN_PORT} -ip ${HOST_IP_PORT} ${QPERF_SERVER_IP} tcp_bw tcp_lat"
done
