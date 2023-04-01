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

```shell
./build.sh mluukkai/express_app mluukkai/testing
```
