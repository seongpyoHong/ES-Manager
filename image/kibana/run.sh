#!/bin/bash

addgroup sudo
adduser -D -g '' kibana
adduser kibana sudo
chown -R kibana /kibana
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Run Kibana, using environment variables to set longopts defining Kibana's
# configuration.
#
# eg. Setting the environment variable:
#
#       ELASTICSEARCH_STARTUPTIMEOUT=60
#
# will cause Kibana to be invoked with:
#
#       --elasticsearch.startupTimeout=60

kibana_vars=(
    elasticsearch.username
    elasticsearch.password
    elasticsearch.hosts
    elasticsearch.ssl.certificate
    elasticsearch.ssl.key
    elasticsearch.ssl.certificateAuthorities
    elasticsearch.ssl.verificationMode
    elasticsearch.pingTimeout
    elasticsearch.requestTimeout
    elasticsearch.requestHeadersWhitelist
    elasticsearch.customHeaders
    elasticsearch.shardTimeout
    elasticsearch.startupTimeout
    elasticsearch.logQueries
    server.ssl.enabled
    server.ssl.certificate
    server.ssl.key
    server.port
    server.basePath
    server.rewriteBasePath
    server.maxPayloadBytes
    server.name
    server.host
    kibana.index
    kibana.defaultAppId
    pid.file
    logging.dest
    logging.slient
    logging.quiet
    logging.verbose
    ops.interval
    il8n.locale
)

longopts=''
for kibana_var in ${kibana_vars[*]}; do
    # 'elasticsearch.url' -> 'ELASTICSEARCH_URL'
    env_var=$(echo ${kibana_var^^} | tr . _)

    # Indirectly lookup env var values via the name of the var.
    # REF: http://tldp.org/LDP/abs/html/bashver2.html#EX78
    value=${!env_var}
    if [[ -n $value ]]; then
      longopt="--${kibana_var}=${value}"
      longopts+=" ${longopt}"
    fi
done

gosu kibana /kibana/bin/kibana ${longopts} &
PID=$!
trap 'kill -TERM ${PID}' INT TERM
echo "Started Kibana (${PID})"
wait ${PID}
