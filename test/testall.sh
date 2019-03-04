#!/bin/bash

DIR=`pwd`

$DIR/test.sh alinode-2-alpine  2001
$DIR/test.sh alinode-2-jessie  2002
$DIR/test.sh alinode-2-slim    2003
$DIR/test.sh alinode-2-stretch 2004
$DIR/test.sh alinode-3-alpine  3001
$DIR/test.sh alinode-3-jessie  3002
$DIR/test.sh alinode-3-slim    3003
$DIR/test.sh alinode-3-stretch 3004
$DIR/test.sh alinode-4-alpine  4001
$DIR/test.sh alinode-4-jessie  4002
$DIR/test.sh alinode-4-slim    4003
$DIR/test.sh alinode-4-stretch 4004


curl http://localhost:2001
curl http://localhost:2002
curl http://localhost:2003
curl http://localhost:2004

curl http://localhost:3001
curl http://localhost:3002
curl http://localhost:3003
curl http://localhost:3004

curl http://localhost:4001
curl http://localhost:4002
curl http://localhost:4003
curl http://localhost:4004

