FROM golang:1.14.2

RUN mkdir /out
RUN mkdir -p /go/src/github.com/jenkins-x-labs

WORKDIR /go/src/github.com/jenkins-x-labs

RUN git clone https://github.com/nxmatic/jxlabs-nos-jxl.git jxl && \
  cd jxl && \
  make linux && \
  mv build/linux/jxl /out/jxl

# jenkins-x
ENV JX_VERSION 2.1.56-jxlabs-nos-3
RUN curl --silent -f -L https://github.com/nuxeo/jxlabs-nos-jx/releases/download/v${JX_VERSION}/jxlabs-nos-jx-linux-amd64.tar.gz | tar xvfCz - /out jx && \
  chmod +x /out/jx

FROM gcr.io/build-jx-prod/jxlabs-nos/jxl-base:0.1.41-jxlabs-nos-5
EXPOSE 8080

COPY --from=0 /out /usr/local/bin

