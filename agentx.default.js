'use strict';

module.exports = {
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
