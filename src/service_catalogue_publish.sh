#!/usr/bin/env bash

SERVICE_METADATA_FILE="service.metadata.json"
SERVICE_NAME=$(jq -r '.name' ${SERVICE_METADATA_FILE})
SERVICE_CATALOGUE_PUBLICATION_URL="${SERVICE_CATALOGUE_ENVIRONMENT_URL}/services/metadata/${SERVICE_NAME}"

echo "${SERVICE_METADATA_FILE} for ${SERVICE_NAME} is currently validated against service catalogue version ${SERVICE_CATALOGUE_VERSION} ..."
echo
echo "Publishing ${SERVICE_METADATA_FILE} for ${SERVICE NAME} at ${SERVICE_CATALOGUE_PUBLICATION_URL} before app deployment commences ..."

curl --request POST --silent -H "Content-Type: application/json" --data @${SERVICE_METADATA_FILE} ${SERVICE_CATALOGUE_PUBLICATION_URL}
curl --request POST --silent --fail -H "Content-Type: application/json" --data @${SERVICE_METADATA_FILE} ${SERVICE_CATALOGUE_PUBLICATION_URL} >/dev/null
EXITCODE=$?
echo

if [ "${EXITCODE}" -ne 0 ]; then
    echo "Publishing ${SERVICE_METADATA_FILE} for ${SERVICE_NAME} against ${SERVICE_CATALOGUE_PUBLICATION_URL} failed. Deployment terminated!"
else
    echo "Publishing ${SERVICE_METADATA_FILE} for ${SERVICE_NAME} against ${SERVICE_CATALOGUE_PUBLICATION_URL} succeeded. Deployment continued!"
fi

echo

exit ${EXITCODE}