FROM gcr.io/jenkinsxio-labs/jxl-base:0.1.41
EXPOSE 8080

COPY ./build/linux/jxl /usr/local/bin/jxl

RUN (curl https://get.helm.sh/helm-v3.2.0-linux-amd64.tar.gz | \
     tar xvfCsz - /tmp /linux-amd64// linux-amd64/helm) && \
    mv /tmp/linux-amd64/helm /usr/local/bin

RUN curl https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
         -o /usr/local/bin/jq && chmod + /usr/local/bin/jq
	 
RUN curl https://github.com/mikefarah/yq/releases/download/3.3.0/yq_linux_amd64 \
         -o /usr/local/bin/yq && chmod +x /usr/local/bin/yq
