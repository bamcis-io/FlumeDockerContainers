#!/bin/bash

echo "Starting flume agent : ${FLUME_AGENT_NAME}"

cat "${FLUME_CONF_FILE}"

su-exec "${FLUME_USER}" flume-ng agent \
	-c "${FLUME_CONF_DIR}" \
	-f "${FLUME_CONF_FILE}" \
	-n "${FLUME_AGENT_NAME}" \
	-Dflume.root.logger=INFO,console \
	-Dflume.monitoring.type=http \
	-Dflume.monitoring.port="${FLUME_REPORTING_PORT}" \
	-DpropertiesImplementation=org.apache.flume.node.EnvVarResolverProperties