#!/usr/bin/env bash
set -euo pipefail

# DATA_DIR が未設定ならデフォルトを使用
DATA_DIR="${DATA_DIR:-/data/mitre-attack-data}"

# 初回起動時に STIX データをダウンロードし、サーバ起動
python -m server --data-dir "${DATA_DIR}"