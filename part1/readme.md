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
