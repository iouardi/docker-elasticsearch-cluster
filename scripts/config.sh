#!/bin/bash

# Fail fast, including pipelines
set -e -o pipefail

function cluster_name() {
    local cluster_name=${CLUSTER_NAME}
    echo "$cluster_name"
}

function cluster_with() {
    local cluster_with=${CLUSTER_WITH}
    echo "$cluster_with"
}

# function es_discovery() {
#     local es_discovery=${ES_DISCOVERY}
#     echo "$es_discovery"
# }



# if [[ -z "$(cluster_name)" ]]; then
#     echo "A Cluster name is required." >&2
#     exit 1
# fi
