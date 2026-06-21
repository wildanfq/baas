FROM alpine:latest

ARG PB_VERSION=0.39.4

RUN apk add --no-cache \
    unzip \
    ca-certificates

ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/ && rm /tmp/pb.zip

EXPOSE 8080

RUN adduser -D -h /pb pocketbase && chown -R pocketbase:pocketbase /pb
USER pocketbase
WORKDIR /pb

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
