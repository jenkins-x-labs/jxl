# syntax = docker/dockerfile:experimental
FROM golang:1.12.9-buster as build

ENV GOPATH=/go

RUN apt-get update && \
    apt-get install -y \
        make \
        go-dep

WORKDIR /go/src/github.com/jenkins-x-labs/jxl

COPY . .

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    make linux

FROM build.yields.io/jxl-base:0.0.3

COPY --from=build /go/src/github.com/jenkins-x-labs/jxl/build/linux/jxl /usr/bin/jxl

ENTRYPOINT ["/usr/bin/jxl"]
