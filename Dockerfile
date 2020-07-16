FROM gcr.io/build-jx-prod/jxlabs-nos-master/jxlabs-nos-jxl-base-image:0.0.4
EXPOSE 8080

ENV JX_VERSION 2.1.3
RUN curl --silent -f -L https://github.com/nuxeo/jxlabs-nos-jx/releases/download/v${JX_VERSION}/jxlabs-nos-jx-linux-amd64.tar.gz | tar xvfCz - /usr/local/bin jx && \
  chmod +x /usr/local/bin/jx

COPY build/linux/jxl /usr/local/bin

