FROM golang:1.19.4-alpine3.17 as builder
ENV GO111MODULE=on

WORKDIR /app
COPY . .

RUN apk add --no-cache git alpine-sdk
RUN set -x \
  && go mod download \
  && go build -o /main ./main.go

FROM alpine:3.17
ARG COMMAND=root
RUN apk update && apk upgrade && \
    apk --no-cache add tzdata &&\
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime &&\
    apk add ca-certificates && rm -rf /var/cache/apk/* && \
    mkdir -m 666 -p /tmp
COPY --from=builder /main ./app/main
CMD ["/bin/sh", "-c", "./app/main"]