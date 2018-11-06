# alinode Docker

Dockerfiles for building runtime image for [Node.js Performance Platform runtime](https://help.aliyun.com/product/60298.html).

The built containter image list can be found [here](https://help.aliyun.com/document_detail/65376.html).

The version map can be found [here](https://help.aliyun.com/document_detail/60811.html).

The built images can be pulled from:

```shell
public:: docker pull registry.cn-hangzhou.aliyuncs.com/aliyun-node/alinode:[image-tag]
internal: docker pull registry-internal.cn-hangzhou.aliyuncs.com/aliyun-node/alinode:[image-tag]
VPC: docker pull registry-vpc.cn-hangzhou.aliyuncs.com/aliyun-node/alinode:[image-tag]
```

# Usage

## build images

```shell
./build.sh 2/3/4 jessie/slim
```

e.g:

```shell
# build image for the latest version alinode-v4.x (node-v10.x)
./build 4 jessie

# build image for the latest version alinode-v4.x (node-v10.x)
./build 4 slim

```

## verify the image

### provide **APP_ID** and **APP_SECRET** via environment variables

```shell
cd test
docker build -t alinodetest .
docker run -it -p 3333:3333 -e "APP_ID=_YOUR_APP_ID" -e "APP_SECRET=_YOUR_APP_SECRET" alinodetest
```

### provide **APP_ID** and **APP_SECRET** via config file

```shell

cd test
# provide APP_ID and APP_SECRET via app-config.json
docker build -t alinodetest .
docker run -it -p 3333:3333 alinodetest
```

Then check from [here](https://node.console.aliyun.com).


## Contribute

You're welcome to make pull requests!
