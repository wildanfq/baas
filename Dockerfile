FROM alpine:3.20

ARG PB_VERSION=0.39.4

RUN apk add --no-cache \
    unzip \
    ca-certificates \
    wget

RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip -O /tmp/pocketbase.zip \
    && unzip /tmp/pocketbase.zip -d /pb \
    && rm /tmp/pocketbase.zip

RUN adduser -D -h /pb pocketbase \
    && chown -R pocketbase:pocketbase /pb

USER pocketbase
WORKDIR /pb

EXPOSE 8080

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
