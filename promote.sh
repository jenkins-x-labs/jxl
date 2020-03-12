#!/bin/bash

echo "promoting the new version ${VERSION} to downstream repositories"

jx step create pr regex \
    --regex '\s+image: gcr.io/jenkinsxio-labs/jxl:(.*)' \
    --version ${VERSION} \
    --files "jenkins-x-*.yml" \
    --repo https://github.com/jenkins-x-labs/jenkins-x-versions.git

jx step create pr regex \
    --regex 'version: (.*)' \
    --version ${VERSION} \
    --files docker/gcr.io/jenkinsxio-labs/jxl.yml \
    --files packages/jxl.yml \
    --files charts/jx-labs/jxl-boot.yml \
    --repo https://github.com/jenkins-x-labs/jenkins-x-versions.git
