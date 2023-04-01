#!/bin/bash

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

echo "Tag and push $HUB:latest"

docker tag autobuild "$HUB:latest"
docker push "$HUB:latest"

echo "Clean up... Remove folder and images"

docker image rm autobuild
cd ../
rm -r -f $FOLDER