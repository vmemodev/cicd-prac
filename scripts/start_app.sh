#!/bin/bash
set -e
cd /opt/myapp

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js not found. Install Node.js first." >&2
  exit 1
fi

if ! command -v pm2 >/dev/null 2>&1; then
  npm i -g pm2
fi

pm2 start dist/server.js --name myapp --update-env
pm2 save