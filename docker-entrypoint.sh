#!/bin/bash
set -e

export ENABLE_NODE_LOG=YES
export NODE_LOG_DIR=/tmp/node_log

source $HOME/.bashrc

if [ "$APP_ID" != "" ] && [ "$APP_SECRET" != "" ]; then
    echo -e "{\n
        \"server\": \"agentserver.alinode.aliyun.com:8080\",\n
        \"appid\": \"$APP_ID\",\n
        \"secret\": \"$APP_SECRET\",\n
        \"heartbeatInterval\": 60,\n
        \"reconnectDelay\": 10,\n
        \"reportInterval\": 60,\n
        \"logdir\": \"$ALINODE_LOGDIR\",\n
        \"cmddir\": \"/root/.tnvm/versions/alinode/v$ALINODE_VERSION/lib/node_modules/commandx\",\n
        \"error_log\": [" > /.agentx.json

    if [ "$AGENTX_ERROR_LOG" != "" ]; then
        echo '"$AGENTX_ERROR_LOG"' >> /.agentx.json
    fi

    echo -e "]\n
    }" >> /.agentx.json

    nohup agentx /.agentx.json &
fi

exec "$@"
