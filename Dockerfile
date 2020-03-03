FROM gcr.io/jenkinsxio-labs/jxl-base:0.0.10
EXPOSE 8080

COPY ./build/linux/jxl /usr/local/bin/jxl
