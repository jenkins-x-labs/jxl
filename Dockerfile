FROM gcr.io/jenkinsxio-labs/jxl-base:0.1.41
EXPOSE 8080

COPY ./build/linux/jxl /usr/local/bin/jxl

# add additional CLIs

ARG HELM_VERSION=3.2.0
RUN curl --silent --location --output /dev/stdout \
         https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz | \
    tar --extract --file=/dev/stdin --directory=/usr/local/bin \
        --strip-components=1 --gunzip linux-amd64/helm

ARG PULUMI_VERSION=2.1.0
RUN curl --silent --location --output /dev/stdout \
         https://get.pulumi.com/releases/sdk/pulumi-v${PULUMI_VERSION}-linux-x64.tar.gz | \
    tar --extract --file=/dev/stdin --directory=/usr/local/bin \
        --strip-components=1 --gunzip pulumi

ARG NODEJS_VERSION=12
RUN curl -f --silent --location https://rpm.nodesource.com/setup_${NODEJS_VERSION}.x | bash - && \
  yum install -y nodejs && yum clean all && \
  npm install -g pnpm

ARG JQ_VERSION=1.6
RUN curl --silent --location --output /usr/local/bin/jq \
         https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 && \
    chmod + /usr/local/bin/jq
	 
ARG YQ_VERSION=3.3.0
RUN curl --silent --location --output /usr/local/bin/yq \
         https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 && \
    chmod +x /usr/local/bin/yq

