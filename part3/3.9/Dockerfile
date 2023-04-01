FROM golang:1.16-alpine as build-stage

WORKDIR /usr/src/app/

RUN apk update && apk upgrade && apk add --no-cache git && \
    git clone https://github.com/docker-hy/material-applications.git && \
    cp -r ./material-applications/example-backend ./ && \
    rm -rf ./material-applications

WORKDIR ./example-backend

RUN adduser -D appuser

RUN CGO_ENABLED=0 go build -o /go/bin/run -ldflags="-w -s"

FROM scratch

WORKDIR /usr/src/app

COPY --from=build-stage /go/bin/run /go/bin/run
# Import the user and group files from the builder.
COPY --from=build-stage /etc/passwd /etc/passwd

# Use an unprivileged user.
USER appuser

EXPOSE 8080

ENTRYPOINT ["/go/bin/run"]