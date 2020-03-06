#!/bin/bash

echo "promoting the new version ${VERSION} to downstream repositories"

jx step create pr regex \
    --regex '\s+image: gcr.io/jenkinsxio-labs/jxl:(.*)' \
    --version ${VERSION} \
    --files "jenkins-x-*.yml" \
    --repo https://github.com/jenkins-x/jenkins-x-versions.git

jx step create pr versions -k docker -n gcr.io/jenkinsxio-labs/jxl -v ${VERSION}
jx step create pr versions -k packages -n jxl -v ${VERSION}

jx step create pr regex \
    --regex '\version: (.*)' \
    --version ${VERSION} \
    --files charts/jx-labs/jxl-boot.yml \
    --repo https://github.com/jenkins-x/jenkins-x-versions.git
