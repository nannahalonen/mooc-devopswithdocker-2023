FROM golang:1.16

WORKDIR /usr/src/app/

RUN git clone https://github.com/docker-hy/material-applications.git && \
    cp -r ./material-applications/example-backend ./ && \
    rm -rf ./material-applications

WORKDIR ./example-backend

RUN go build && \
    adduser appuser

USER appuser

EXPOSE 8080

CMD ./server