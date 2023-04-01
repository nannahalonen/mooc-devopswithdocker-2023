FROM golang:1.16-alpine

WORKDIR /usr/src/app/

RUN apk update && apk upgrade && apk add --no-cache git && \
    git clone https://github.com/docker-hy/material-applications.git && \
    cp -r ./material-applications/example-backend ./ && \
    rm -rf ./material-applications

WORKDIR ./example-backend

RUN go build && \
    adduser -D appuser

USER appuser

EXPOSE 8080

CMD ./server