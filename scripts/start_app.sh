#!/bin/bash
# コマンドが1つでも失敗したらスクリプト全体を終了する
set -e
# アプリディレクトリへ移動
cd /opt/myapp

# Node.jsがインストールされているか確認
# command -v node ⇒ nodeコマンドが存在するか確認するコマンド
# >/dev/null 2>&1 ⇒ エラー出力を表示しない（静かに確認）
if ! command -v node >/dev/null 2>&1; then
  echo "Node.js not found. Install Node.js first." >&2
  exit 1
fi

# pm2 があるか確認
if ! command -v pm2 >/dev/null 2>&1; then
  npm i -g pm2
fi

# アプリ起動
# dist/index.js を pm2 で起動
pm2 start dist/index.js --name myapp --update-env
# PM2のプロセスリストを保存
pm2 save