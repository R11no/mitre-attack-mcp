# ベースイメージ
FROM python:3.11-slim

# 環境変数（UTF-8, 非対話, データディレクトリ）
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DATA_DIR=/data/mitre-attack-data

# 必要パッケージのインストール（curl は将来のデバッグ用）
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# アプリソースのコピー
COPY server.py /app/server.py

# データディレクトリ作成
RUN mkdir -p ${DATA_DIR}

# ポートは使用しない（stdio 通信）。必要に応じて開ける。
# EXPOSE 3000

# エントリポイント
ENTRYPOINT ["/app/run.sh"]