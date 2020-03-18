FROM gcr.io/jenkinsxio-labs/jxl-base:0.1.19
EXPOSE 8080

COPY ./build/linux/jxl /usr/local/bin/jxl
