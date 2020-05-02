FROM gcr.io/jenkinsxio-labs/jxl-base:0.1.41
EXPOSE 8080

RUN (curl https://get.helm.sh/helm-v3.2.0-linux-amd64.tar.gz | tar xvfCz - /tmp linux-amd64/helm) && mv /tmp/linux-amd64/helm /usr/local/bin

COPY ./build/linux/jxl /usr/local/bin/jxl
