#!/bin/bash

echo "Starting flume agent : ${FLUME_AGENT_NAME}"

cat "${FLUME_CONF_FILE}"

COMMAND="flume-ng agent -c ${FLUME_CONF_DIR} -f ${FLUME_CONF_FILE} -n ${FLUME_AGENT_NAME} -Dflume.root.logger=INFO,console -Dflume.monitoring.type=http -Dflume.monitoring.port=${FLUME_REPORTING_PORT} -DpropertiesImplementation=org.apache.flume.node.EnvVarResolverProperties"

# The environment variables in the .env file are scoped to root and need to be made available to the flume
# user account
su --login "${FLUME_USER}" --command "export HDFS_NAMENODE=${HDFS_NAMENODE} && export KAFKA_SERVERS=${KAFKA_SERVERS} && ${COMMAND}"