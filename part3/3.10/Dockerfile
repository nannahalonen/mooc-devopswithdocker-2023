FROM node:16-alpine

COPY /src /usr/src/app/

WORKDIR /usr/src/app/

RUN npm install && \
    adduser -D appuser

EXPOSE 8080

USER appuser

CMD node express.js