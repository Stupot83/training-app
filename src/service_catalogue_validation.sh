#!/usr/bin/env bash

SERVICE_METADATA_FILE="service.metadata.json"
SERVICE_NAME=$(jq -r '.name' ${SERVICE_METADATA_FILE})
SERVICE_CATALOGUE_VALIDATION_URL="https://engineering-service-catalogue-api.maiya.io/metadata/validate/${SERVICE_CATALOGUE_VERSION}"

echo "The current version of the service catalogue is ${SERVICE_CATALOGUE_VERSION} ..."
echo
echo "Validating ${SERVICE_METADATA_FILE} for ${SERVICE_NAME} against service catalogue version ${SERVICE_CATALOGUE_VERSION} before app build commences ..."

curl --request POST --silent -H "Content-Type: application/json" --data @${SERVICE_METADATA_FILE} ${SERVICE_CATALOGUE_VALIDATION_URL}
curl --request POST --silent --fail -H "Content-Type: application/json" --data @${SERVICE_METADATA_FILE} ${SERVICE_CATALOGUE_VALIDATION_URL} >/dev/null
EXITCODE=$?
echo

if [ "${EXITCODE}" -ne 0 ]; then
    echo "Validation failed against service catalogue version ${SERVICE_CATALOGUE_VERSION} at ${SERVICE_CATALOGUE_VALIDATION_URL} for ${SERVICE_NAME}! Build terminated!"
else
    echo "Validation succeeded against service catalogue schema version ${SERVICE_CATALOGUE_VERSION} at ${SERVICE_CATALOGUE_VALIDATION_URL} for ${SERVICE_NAME}! Build continued!"
fi

echo

exit ${EXITCODE}
