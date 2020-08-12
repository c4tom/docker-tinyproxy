FROM alpine:3.12

RUN apk add --no-cache bash tinyproxy

COPY run.sh /opt/docker-tinyproxy/run.sh

ENTRYPOINT ["/opt/docker-tinyproxy/run.sh"]
