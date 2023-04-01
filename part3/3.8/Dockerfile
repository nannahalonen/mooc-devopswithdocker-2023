FROM node:16-alpine as build-stage

ENV REACT_APP_BACKEND_URL=http://localhost:9090

WORKDIR /usr/src/app/

RUN apk update && apk upgrade && apk add --no-cache git && \
    git clone https://github.com/docker-hy/material-applications.git && \
    cp -r ./material-applications/example-frontend ./ && \
    rm -rf ./material-applications

WORKDIR ./example-frontend

RUN npm install && \
    npm run build

RUN adduser -D appuser

FROM nginx:alpine

COPY --from=build-stage /usr/src/app/example-frontend/build /usr/share/nginx/html
# Import the user and group files from the builder.
COPY --from=build-stage /etc/passwd /etc/passwd

# set file permissions for nginx user
RUN chown -R appuser /var/cache/nginx /etc/nginx/ /var/run/ /usr/share/nginx/html/

# Use an unprivileged user.
USER appuser

ENTRYPOINT ["nginx", "-g", "daemon off;"]