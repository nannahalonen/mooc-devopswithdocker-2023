# Part 3

## EXERCISE 3.1: YOUR PIPELINE

./github/workflows/deploy.yml

```shel
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

Example for AWS.


```shel
name: Deploy to Amazon ECS

on:
  push:
    branches: [ "main" ]

env:
  AWS_REGION: MY_AWS_REGION                   # set this to your preferred AWS region, e.g. us-west-1
  ECR_REPOSITORY: MY_ECR_REPOSITORY           # set this to your Amazon ECR repository name
  ECS_SERVICE: MY_ECS_SERVICE                 # set this to your Amazon ECS service name
  ECS_CLUSTER: MY_ECS_CLUSTER                 # set this to your Amazon ECS cluster name
  ECS_TASK_DEFINITION: MY_ECS_TASK_DEFINITION # set this to the path to your Amazon ECS task definition
                                               # file, e.g. .aws/task-definition.json
  CONTAINER_NAME: MY_CONTAINER_NAME           # set this to the name of the container in the
                                               # containerDefinitions section of your task definition

permissions:
  contents: read

jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    environment: production

    steps:
    - name: Checkout
      uses: actions/checkout@v3

    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ${{ env.AWS_REGION }}

    - name: Login to Amazon ECR
      id: login-ecr
      uses: aws-actions/amazon-ecr-login@v1

    - name: Build, tag, and push image to Amazon ECR
      id: build-image
      env:
        ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
        IMAGE_TAG: ${{ github.sha }}
      run: |
        # Build a docker container and
        # push it to ECR so that it can
        # be deployed to ECS.
        docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .
        docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
        echo "image=$ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG" >> $GITHUB_OUTPUT

    - name: Fill in the new image ID in the Amazon ECS task definition
      id: task-def
      uses: aws-actions/amazon-ecs-render-task-definition@v1
      with:
        task-definition: ${{ env.ECS_TASK_DEFINITION }}
        container-name: ${{ env.CONTAINER_NAME }}
        image: ${{ steps.build-image.outputs.image }}

    - name: Deploy Amazon ECS task definition
      uses: aws-actions/amazon-ecs-deploy-task-definition@v1
      with:
        task-definition: ${{ steps.task-def.outputs.task-definition }}
        service: ${{ env.ECS_SERVICE }}
        cluster: ${{ env.ECS_CLUSTER }}
        wait-for-service-stability: true
```