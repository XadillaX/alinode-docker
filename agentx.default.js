'use strict';

const fs = require('fs');

const defaults = {
  "server": "agentserver.alinode.aliyun.com:8080",
  "appid": `${process.env.APP_ID}`,
  "secret": `${process.env.APP_SECRET}`,
  "heartbeatInterval": 60,
  "reconnectDelay": 10,
  "reportInterval": 60,
  "logdir": `${process.env.NODE_LOG_DIR}`,
  "cmddir": `/root/.tnvm/versions/alinode/v${process.env.ALINODE_VERSION}/lib/node_modules/commandx`,
  "error_log": []
};

const custom = require(`${process.env.HOME}/alinode-app.json`);

const output = JSON.stringify(Object.assign(defaults, custom));
fs.writeFileSync(`${process.env.HOME}/agentx.json`, output);
