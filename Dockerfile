FROM golang:1.14.2

RUN mkdir /out
RUN mkdir -p /go/src/github.com/jenkins-x-labs

WORKDIR /go/src/github.com/jenkins-x-labs

RUN git clone https://github.com/nxmatic/jxlabs-nos-jxl.git jxl && \
  cd jxl && \
  make linux && \
  mv build/linux/jxl /out/jxl

FROM gcr.io/build-jx-prod/jxlabs-nos/jxl-base:latest
EXPOSE 8080

COPY --from=0 /out/jxl /usr/local/bin/jxl

