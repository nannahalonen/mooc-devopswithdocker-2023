FROM node:16

WORKDIR /usr/src/app/

RUN git clone https://github.com/docker-hy/material-applications.git && \
    cp -r ./material-applications/example-frontend ./ && \
    rm -rf ./material-applications

WORKDIR ./example-frontend

ENV REACT_APP_BACKEND_URL=http://localhost:9090

RUN npm install && \
    npm run build && \
    npm install -g serve

EXPOSE 5000

# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#non-root-user
USER node

CMD serve -s -l 5000 build