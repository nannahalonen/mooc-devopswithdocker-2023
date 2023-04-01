#!/bin/bash

echo "Login with $DOCKER_USERNAME"

cat ./token.txt | docker login --username $DOCKER_USERNAME --password-stdin

REPO=$1
HUB=$2

echo "Clone: https://github.com/$REPO"

git clone "https://github.com/$REPO"

# Set delimiter
IFS='/'
#Read the split words into an array based on delimiter
read -a array <<< $REPO
FOLDER="${array[1]}"
echo "Project folder: $FOLDER"

cd $FOLDER

docker build -t autobuild .

echo "Tag and push $HUB"

docker tag autobuild "$HUB"
docker push "$HUB"

echo "Clean up... Remove folder and images"

docker image rm autobuild
cd ../
rm -r -f $FOLDER