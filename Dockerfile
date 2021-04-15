FROM golang:1-alpine AS build-env

RUN apk add --no-cache --upgrade git openssh-client ca-certificates

WORKDIR /go/src
COPY go.* *.go ./

RUN go build .

FROM alpine:latest

COPY --from=build-env /go/src/addlicense /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/addlicense"]
