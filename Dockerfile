FROM gcr.io/jenkinsxio-labs/jxl-base:0.1.41
EXPOSE 8080

COPY ./build/linux/jxl /usr/local/bin/jxl

RUN curl --silent --location --output /dev/stdout \
         https://get.helm.sh/helm-v3.2.0-linux-amd64.tar.gz | \
    tar --extract --file=/dev/stdin --directory=/usr/local/bin \
        --strip-components=1 --gunzip linux-amd64/helm

RUN curl --silent --location --output /usr/local/bin/jq \
         https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
    chmod + /usr/local/bin/jq
	 
RUN curl --silent --location --output /usr/local/bin/yq \
         https://github.com/mikefarah/yq/releases/download/3.3.0/yq_linux_amd64 && \
    chmod +x /usr/local/bin/yq
