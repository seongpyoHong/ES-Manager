#!/bin/sh

CDIR=$(cd `dirname "$0"` && pwd)
cd "$CDIR"

print_red() {
  printf '%b' "\033[91m$1\033[0m\n"
}

print_green() {
  printf '%b' "\033[92m$1\033[0m\n"
}

render_template() {
  eval "echo \"$(cat "$1")\""
}

#KUBECTL_PARAMS="--context=foo"
NAMESPACE=default
KUBECTL="kubectl ${KUBECTL_PARAMS}"

NODES=$(eval "${KUBECTL} get nodes -l 'kubernetes.io/role!=master' -o go-template=\"{{range .items}}{{\\\$name := .metadata.name}}{{\\\$unschedulable := .spec.unschedulable}}{{range .status.conditions}}{{if eq .reason \\\"KubeletReady\\\"}}{{if eq .status \\\"True\\\"}}{{if not \\\$unschedulable}}{{\\\$name}}{{\\\"\\\\n\\\"}}{{end}}{{end}}{{end}}{{end}}{{end}}\"")
ES_DATA_REPLICAS=$(echo "$NODES" | wc -l)


print_green "Labeling nodes which will serve Elasticsearch data pods"
for node in $NODES; do
  eval "${KUBECTL} label node ${node} elasticsearch.data=true --overwrite"
done

# for yaml in *.yaml.tmpl; do
#   render_template "${yaml}" | eval "${KUBECTL} create -f -"
# done

for yaml in *.yaml; do
  eval "${KUBECTL} create -f \"${yaml}\""
done

eval "${KUBECTL} create configmap es-config --from-file=es-config --dry-run -o yaml" | eval "${KUBECTL} apply -f -"
# eval "${KUBECTL} create configmap fluentd-config --from-file=docker/fluentd/td-agent.conf --dry-run -o yaml" | eval "${KUBECTL} apply -f -"
# eval "${KUBECTL} create configmap kibana-config --from-file=kibana.yml --dry-run -o yaml" | eval "${KUBECTL} apply -f -"

eval "${KUBECTL} get pods $@"
