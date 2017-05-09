#!/bin/bash
set -e

source $HOME/.bashrc

if [ -f $HOME/alinode-app.json ]; then
    ENABLE_NODE_LOG=NO node -p 'Object.assign(require("$HOME/agentx.default.js"), require("$HOME/alinode-app.json"))' > $HOME/agentx.json
    ENABLE_NODE_LOG=NO agentx $HOME/agentx.json &
fi

exec "$@"
