FROM ubuntu
# https://docs.docker.com/engine/install/ubuntu/ 

WORKDIR /usr/src/app

RUN apt-get update
RUN apt-get install -y \
    git \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
RUN mkdir -m 0755 -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

RUN echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update

RUN apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

WORKDIR /usr/src/app

COPY build.sh .
COPY password.txt .

RUN chmod +x build.sh

CMD ./build.sh