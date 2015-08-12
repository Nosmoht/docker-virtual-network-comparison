#!/bin/bash
#set -x

# Source configuration file
source config.sh

# Start Docker container running qperf client
for i in $(seq 1 10); do
	vagrant ssh ${CLIENT_NAME} -c "docker run -ti  --name qperf-client --rm ${DOCKER_IMAGE} -lp ${HOST_LISTEN_PORT} -ip ${HOST_IP_PORT} ${SERVER_IP} tcp_bw tcp_lat"
done
