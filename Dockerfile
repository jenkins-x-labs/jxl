FROM golang:1.14.2

RUN mkdir /out
RUN mkdir -p /go/src/github.com/jenkins-x-labs

WORKDIR /go/src/github.com/jenkins-x-labs

RUN git clone https://github.com/nxmatic/jxlabs-nos-jxl.git jxl && \
  cd jxl && \
  git checkout jxlabs-nos && \
  make linux && \
  mv build/linux/jxl /out/jxl

FROM gcr.io/build-jx-prod/jxlabs-nos/jxl-base:0.1.41-jxlabs-nos-1
EXPOSE 8080

COPY --from=0 /out/jxl /usr/local/bin/jxl

# add additional CLIs

ARG PULUMI_VERSION=2.1.0
RUN curl --silent --location --output /dev/stdout \
         https://get.pulumi.com/releases/sdk/pulumi-v${PULUMI_VERSION}-linux-x64.tar.gz | \
    tar --extract --file=/dev/stdin --directory=/usr/local/bin \
        --strip-components=1 --gunzip pulumi

ARG NODEJS_VERSION=12
RUN curl -f --silent --location https://rpm.nodesource.com/setup_${NODEJS_VERSION}.x | bash - && \
  yum install -y nodejs && yum clean all && \
  npm install -g pnpm
