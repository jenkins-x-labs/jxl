ENV JXL_BASE_IMAGE_VERSION 0.0.6
FROM gcr.io/build-jx-prod/jxlabs-nos-master/jxlabs-nos-jxl-base-image:${JXL_BASE_IMAGE_VERSION}
EXPOSE 8080

ENV JX_VERSION 2.1.51-2-d9832b17-master
RUN curl --silent -f -L https://github.com/nuxeo/jxlabs-nos-jx/releases/download/v${JX_VERSION}/jxlabs-nos-jx-linux-amd64.tar.gz | tar xvfCz - /usr/local/bin jx && \
  chmod +x /usr/local/bin/jx

COPY build/linux/jxl /usr/local/bin

