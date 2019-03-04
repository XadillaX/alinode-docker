#!/bin/bash

echo $1 $2

if [ -z $1 ]
then
  echo 'usage:   ./build.sh  TEST_IMAGE'
  exit -1
fi

port=$2
if [ -z $2 ]
then
  port=3333
fi

sed "s/TEST_PORT/$port/g" hello.js.template > ./hello.js

echo '==== ' test-$1  ' port ' $port

sed "s/TEST_IMAGE/$1/g" Dockerfile.template > ./Dockerfile

docker build -t test-$1 .

docker run -d -p $port:$port test-$1

