#!/bin/bash

echo "promoting the new version ${VERSION} to downstream repositories"

exit 0 # do nothing for now

jx step create pr regex \
    --regex '\s+image: gcr.io/jxlabs-nos/jxl:(.*)' \
    --version ${VERSION} \
    --files "jenkins-x-*.yml" \
    --repo https://github.com/nuxeo/jxlabs-nos-versions.git

jx step create pr regex \
    --regex 'version: (.*)' \
    --version ${VERSION} \
    --files docker/gcr.io/jxlabs-nos/jxl.yml \
    --files packages/jxl.yml \
    --files charts/jx-labs/jxl-boot.yml \
    --repo https://github.com/nuxeo/jxlabs-nos-versions.git

jx step create pr regex \
    --regex 'JX_DEFAULT_IMAGE: gcr.io/jxlabs-nos/jxl:(.*)' \
    --version ${VERSION} \
    --files apps/jenkins-x/lighthouse/values.yaml.gotmpl \
    --repo https://github.com/nuxeo/jxlabs-nos-versions.git
