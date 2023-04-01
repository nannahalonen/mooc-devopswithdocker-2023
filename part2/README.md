# Part 2

## EXERCISE 2.1

```shell
docker compose up
[+] Running 2/2
 - Network 21_default       Created
 - Container excersice2     Created
Attaching to excersice2.1
excersice2.1  | Starting log output
excersice2.1  | Wrote text to /usr/src/app/text.log
```

## EXERCISE 2.2


```shell
cd ./part2/2.2
docker compose up -d
```

## MANDATORY EXERCISE 2.3

```shell
cd ./part2/2.3
docker compose up -d
```

## EXERCISE 2.4

```shell
cd ./part2/2.4
docker compose up -d
```

## EXERCISE 2.5

```shel
git clone https://github.com/docker-hy/material-applications
cd .\material-applications\scaling-exercise\
docker-compose up -d --scale compute=2
```

![image](https://user-images.githubusercontent.com/19561253/228910037-2f306064-1de6-46b7-9f9d-44ed739a7873.png)

## EXERCISE 2.6-2.7

```shell
cd ./part2/2.7
docker compose up -d
```

## EXERCISE 2.8-2.10

Comment enviroment variable REACT_APP_BACKEND_URL at ./part1/1.12 and rebuild image

```shell
ENV REACT_APP_BACKEND_URL=http://localhost:9090
```

Note that the app is setup to run at port 9000.

```shell
cd ./part2/2.8
docker compose up -d
```

```shell
docker run -it --rm --network host networkstatic/nmap localhost
Unable to find image 'networkstatic/nmap:latest' locally
latest: Pulling from networkstatic/nmap
213ec9aee27d: Pull complete
c7286bfc71dc: Pull complete
Digest: sha256:a4a64067a87bcd32d3814f65218e4a5bd97e7eb617788c1aea4c086b1ad405a3
Status: Downloaded newer image for networkstatic/nmap:latest
Starting Nmap 7.92 ( https://nmap.org ) at 2023-03-30 16:51 UTC
Nmap scan report for localhost (127.0.0.1)
Host is up (0.0000060s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 998 closed tcp ports (reset)
PORT     STATE    SERVICE
111/tcp  open     rpcbind
9000/tcp filtered cslistener
```

