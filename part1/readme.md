# Part 1

## EXERCISE 1.1: GETTING STARTED

```shell
docker container run -d nginx
docker container run -d httpd
docker container run -d -e POSTGRES_PASSWORD=password postgres
```

```shell
docker container stop 728856b029e2
docker container stop 28075d93e959
```

```shell
C:\Users\nanna>docker ps -a
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS                        PORTS                                      NAMES
412f5d3c0c3c   postgres                "docker-entrypoint.s…"   28 seconds ago   Up  10 minute                 5432/tcp                                   nostalgic_mirzakhani
728856b029e2   httpd                   "httpd-foreground"       14 minutes ago   Exited (0) 11 minutes ago                                                naughty_borg
28075d93e959   nginx                   "/docker-entrypoint.…"   26 minutes ago   Exited (0) 11 minutes ago                                                lucid_varahamihira
```

## EXERCISE 1.2: CLEANUP

```shell
docker container stop 412f5d3c0c3c
docker container prune
```
    
```shell
docker image prune
```

```shell
C:\Users\nanna>docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

```shell
C:\Users\nanna>docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
```

## EXERCISE 1.3: SECRET MESSAGE

```shell
docker run -d --rm -it --name excersice1.3 devopsdockeruh/simple-web-service:ubuntu
docker exec -it excersice1.3
tail -f ./text.log
```

```shell
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
```

## EXERCISE 1.4: MISSING DEPENDENCIES

```shell
docker run --rm -it --name excersice1.4 ubuntu sh -c "apt-get update; apt-get -y install curl; while true; do echo 'Input website:'; read website; echo 'Searching..'; sleep 1; curl http://$website; done"
```

```shell
Input website:
helsinki.fi
Searching..
<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx/1.20.1</center>
</body>
</html>Input website:
helsinki.fi
Searching..
<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx/1.20.1</center>
</body>
</html>
```

## EXERCISE 1.5: SIZES OF IMAGES

```shell
docker image pull devopsdockeruh/simple-web-service:alpine
```

```shell
REPOSITORY                          TAG                                    IMAGE ID       CREATED         SIZE
devopsdockeruh/simple-web-service   ubuntu                                 4e3362e907d5   2 years ago     83MB
devopsdockeruh/simple-web-service   alpine                                 fd312adc88e0   2 years ago     15.7MB
```

```shell
docker run -d --rm -it --name excersice1.5  devopsdockeruh/simple-web-service:alpine
docker exec -it excersice1.5 sh
tail -f ./text.log
```

## EXERCISE 1.6: HELLO DOCKER HUB

```shell
 docker run -it devopsdockeruh/pull_exercise
```

```shell
Give me the password: basics
You found the correct password. Secret message is:
"This is the secret message"
```

## EXERCISE 1.7: IMAGE FOR SCRIPT


```shell
cd .\part1\1.7\ && docker build . -t curler
```

```shell
docker run -it curler 
Input website:
helsinki.fi
Searching..
<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx/1.20.1</center>
</body>
</html>
Input website:
```

## EXERCISE 1.8: TWO LINE DOCKERFILE

```shell
docker build . -t web-server
docker run --rm -it web-server

[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /*path                    --> server.Start.func1 (3 handlers)
[GIN-debug] Listening and serving HTTP on :8080
```

## EXERCISE 1.9: VOLUMES

```shell
docker run -d -v d:/MOOC/devopswithdocker/part1/1.9/text.log:/usr/src/app/text.log --rm -it --name excersice1.9 devopsdockeruh/simple-web-service
```

## EXERCISE 1.10: PORTS OPEN

```shell
docker run --rm -p 9000:8080 -it web-server
```

```shell
// 20230328205359
// http://localhost:9000/
{
  "message": "You connected to the following path: /",
  "path": "/"
}

[GIN-debug] Listening and serving HTTP on :8080
[GIN] 2023/03/28 - 17:53:57 | 200 |       226.3µs |      172.17.0.1 | GET      "/"
[GIN] 2023/03/28 - 17:53:57 | 200 |        32.6µs |      172.17.0.1 | GET      "/favicon.ico"
[GIN] 2023/03/28 - 17:53:58 | 200 |        35.6µs |      172.17.0.1 | GET      "/"
[GIN] 2023/03/28 - 17:53:59 | 200 |        36.5µs |      172.17.0.1 | GET      "/favicon.ico"
```

## EXERCISE 1.11: SPRING

```shell
cd ./1.11
docker build . -t excersice1.11
docker run -p 9000:8080 excersice1.11
```

## MANDATORY EXERCISE 1.12: HELLO, FRONTEND!

```shell
cd ./1.12
docker build . -t excersice1.12
docker run -d -p 9000:5000 excersice1.12
```

## MANDATORY EXERCISE 1.13: HELLO, BACKEND!

```shell
cd ./1.12
docker build . -t excersice1.13
docker run -d -p 9090:8080 excersice1.13
```

## MANDATORY EXERCISE 1.14: ENVIRONMENT

```shell
docker run -d -p 9000:5000 excersice1.12
docker run -d -p 9090:9090 --env PORT=9090 --env REQUEST_ORIGIN=http://localhost:9000 excersice1.13
```

## EXERCISE 1.15: HOMEWORK

```shell
cd ./1.15
docker build . -t excersice1.15
docker run -d -p 9000:3000 excersice1.15
docker tag excersice1.15 nannahalonen/hello-world:v1
docker push nannahalonen/hello-world:v1
```

https://hub.docker.com/r/nannahalonen/hello-world

```shell
docker run -d -p 9000:3000 nannahalonen/hello-world:v1
```

## EXERCISE 1.16: CLOUD DEPLOYMENT