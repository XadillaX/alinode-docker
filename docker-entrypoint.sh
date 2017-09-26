#!/bin/bash
set -e

source $HOME/.bashrc

if [ -f $HOME/alinode-app.json ]; then
  ENABLE_NODE_LOG=NO node $HOME/agentx.default.js
  ENABLE_NODE_LOG=NO agentx $HOME/agentx.json &
fi

exec "$@"
