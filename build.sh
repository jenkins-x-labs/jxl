#!/bin/sh

echo "building container image version: $VERSION"

gcloud builds submit --config cloudbuild.yaml --project jenkinsxio-labs
