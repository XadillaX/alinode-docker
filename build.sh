#!/bin/bash

VER=$1
BASE=$2

cp ./$VER/$BASE/Dockerfile ./

docker build -t alinode .


