FROM golang:1.16

WORKDIR /usr/src/app/

RUN git clone https://github.com/docker-hy/material-applications.git

WORKDIR ./material-applications/example-backend

RUN go build

EXPOSE 8080

RUN adduser appuser

USER appuser

CMD ./server