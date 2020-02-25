FROM scratch
EXPOSE 8080
ENTRYPOINT ["/jx-labs"]
COPY ./build/linux /