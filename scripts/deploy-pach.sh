#!/bin/bash

set -ex

RESOURCE_GROUP=japoon-k8s
STORAGE_ACCOUNT=japoonpachyderm
CONTAINER_NAME=pach
STORAGE_SIZE=10
VOLUME_URI="https://japoonpachyderm.blob.core.windows.net/data/pach-etcd-disk.vhd"
STORAGE_KEY="$(az storage account keys list \
                 --account-name="${STORAGE_ACCOUNT}" \
                 --resource-group="${RESOURCE_GROUP}" \
                 --output=json \
                 | jq .[0].value -r
              )"
pachctl deploy microsoft ${CONTAINER_NAME} ${STORAGE_ACCOUNT} ${STORAGE_KEY} ${STORAGE_SIZE} --static-etcd-volume=${VOLUME_URI}