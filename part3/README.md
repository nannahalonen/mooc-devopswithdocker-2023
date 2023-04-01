# Part 3

## EXERCISE 3.1: YOUR PIPELINE

./github/workflows/deploy.yml

```shell
2023-04-01 13:59:00 excersice3.1-watchtower  | time="2023-04-01T10:59:00Z" level=info msg="Watchtower 1.5.3"
2023-04-01 14:01:26 excersice3.1-helloworld  | Example app listening on port 8080
2023-04-01 13:59:00 excersice3.1-watchtower  | time="2023-04-01T10:59:00Z" level=info msg="Using no notifications"
2023-04-01 13:59:00 excersice3.1-watchtower  | time="2023-04-01T10:59:00Z" level=info msg="Checking all containers (except explicitly disabled with label)"
2023-04-01 13:59:00 excersice3.1-watchtower  | time="2023-04-01T10:59:00Z" level=info msg="Scheduling first run: 2023-04-01 11:00:00 +0000 UTC"
2023-04-01 13:59:00 excersice3.1-watchtower  | time="2023-04-01T10:59:00Z" level=info msg="Note that the first check will be performed in 59 seconds"
2023-04-01 14:00:03 excersice3.1-watchtower  | time="2023-04-01T11:00:03Z" level=info msg="Session done" Failed=0 Scanned=2 Updated=0 notify=no
2023-04-01 14:01:12 excersice3.1-watchtower  | time="2023-04-01T11:01:12Z" level=info msg="Found new nannahalonen/hello-world:latest image (72913cf38713)"
2023-04-01 14:01:14 excersice3.1-watchtower  | time="2023-04-01T11:01:14Z" level=info msg="Stopping /excersice3.1-helloworld (116961dcb98f) with SIGTERM"
2023-04-01 14:01:24 excersice3.1-watchtower  | time="2023-04-01T11:01:24Z" level=info msg="Creating /excersice3.1-helloworld"
2023-04-01 14:01:26 excersice3.1-watchtower  | time="2023-04-01T11:01:26Z" level=info msg="Session done" Failed=0 Scanned=2 Updated=1 notify=no
```

## EXERCISE 3.2: A DEPLOYMENT PIPELINE TO A CLOUD SERVICE

Render.com pulls changes from repository automatically, no need to setup actions.

Change Root Directory to part3/3.2 (to use docker hub instead of Dockerfile)

https://hello-world-fgxbafanwc.onrender.com/

## EXERCISE 3.3: BUILDING IMAGES INSIDE OF A CONTAINER

Make sure to run docker login before running the script.

```shell
./build.sh mluukkai/express_app mluukkai/testing:latest
```

## EXERCISE 3.4: BUILDING IMAGES INSIDE OF A CONTAINER

```shell
docker build . -t excersice3.4
docker run --rm -v "//var/run/docker.sock:/var/run/docker.sock" -e DOCKER_USERNAME=nannahalonen excersice3.4 ./build.sh mluukkai/express_app nannahalonen/docker-in-docker:latest
```

## EXERCISE 3.5

```shell
docker build . -t excersice3.5-frontend
docker run -d -p 9000:5000 excersice3.5-frontend

docker build . -t excersice3.5-backend
docker run -d -p 9090:8080 --env PORT=8080 --env REQUEST_ORIGIN=http://localhost:9000 excersice3.5-backend
```

## EXERCISE 3.6

```shell
excersice3.5-backend    latest    3f35cbdc2bf3   About an hour ago   1.07GB
excersice3.6-backend    latest    1a1926961f65   14 minutes ago      1.07GB
excersice3.5-frontend   latest    e9082f0b5a0b   14 minutes ago      1.26GB
excersice3.6-frontend   latest    e93cdfc811e9   5 minutes ago       1.26GB
```

## EXERCISE 3.7

```shell
excersice3.6-backend    latest    1a1926961f65   14 minutes ago      1.07GB
excersice3.7-backend    latest    bbecf49d023b   19 seconds ago      469MB
excersice3.6-frontend   latest    e93cdfc811e9   5 minutes ago       1.26GB
excersice3.7-frontend   latest    14c33681b493   10 minutes ago      477MB
```

## EXERCISE 3.8: MULTI-STAGE FRONTEND

```shell
excersice3.8-frontend   latest    1106697cc54e   37 seconds ago      42.2MB

docker run -d -p 9000:80 excersice3.8-frontend
```

## EXERCISE 3.9: MULTI-STAGE BACKEND

```shell
excersice3.9-backend    latest    b862779c8530   32 seconds ago      13.1MB

docker run -d -p 9090:8080 --env PORT=8080 --env REQUEST_ORIGIN=http://localhost:9000 excersice3.9-backend
```

## EXERCISE 3.10

```shell
excersice1.16           latest    5dcd28636d0a   3 seconds ago        915MB
excersice3.10           latest    4dc31b942147   14 seconds ago       122MB
```