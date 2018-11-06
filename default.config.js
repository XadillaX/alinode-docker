'use strict';

const fs = require('fs');

const defaults = {
  "server": "wss://agentserver.node.aliyun.com:8080",
  "heartbeatInterval": 60,
  "reconnectDelay": 10,
  "reportInterval": 60,
  "error_log": []
};

var custom = {};

if (fs.existsSync(`${process.env.HOME}/app-config.json`)) {
  custom = require(`${process.env.HOME}/app-config.json`);
}

const config = Object.assign(defaults, custom);

config.appid = config.appid || process.env.APP_ID;
config.secret = config.secret || process.env.APP_SECRET;
config.logdir = config.logdir || process.env.NODE_LOG_DIR || '/tmp';

if (config.appid && config.secret) {
  const runningCfg = `${process.env.HOME}/agenthub-running.json`;
  fs.writeFileSync(runningCfg, JSON.stringify(config, null, 2));
}
