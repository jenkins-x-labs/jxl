FROM gcr.io/jenkinsxio-labs/jxl:0.0.1
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/jxl"]
COPY ./build/linux/jxl /usr/local/bin/jxl