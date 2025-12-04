# MITRE ATT&CK MCP Server

MITRE ATT&CKのデータをローカルでダウンロードし、MCPサーバとして公開するツールです。

## セットアップ

### 1. Dockerイメージのビルド

```bash
docker compose build
```

### 2. VSCode MCP設定

VSCodeの設定ファイル（mcp.json）に以下を追加:

```json
{
  "mcpServers": {
    "mitre-attack": {
      "command": "docker",
      "args": [
        "run",
        "--rm",
        "-i",
        "--volume",
        "mitre-attack-data:/data/mitre-attack-data",
        "mitre-attack-mcp:latest"
      ]
    }
  }
}
```

### 3. VSCodeを再起動

設定を反映させるため、VSCodeを再起動します。

## 起動

VSCodeのMCPクライアントから自動的に起動されます。上記のセットアップが完了していれば、MCPツールとして利用可能になります。
初回起動時はSTIXデータのダウンロードが自動的に実行されます。

## 使い方

MCPクライアント経由で以下のようなツールが使用できます:

- `generate_layer`: ATT&CK NavigatorレイヤーをJSON形式で生成
- その他、MITRE ATT&CKデータの検索・取得機能

## データの永続化

Dockerボリューム `mitre-attack-data` にデータが保存されます。初回実行時に自動的にダウンロードされます。


## トラブルシューティング

### データが見つからないエラー

初回実行時にデータのダウンロードに時間がかかる場合があります。以下のコマンドで事前にダウンロードできます:

```bash
docker run --rm -v mitre-attack-data:/data/mitre-attack-data mitre-attack-mcp:latest
```

### Dockerボリュームのリセット

```bash
docker volume rm mitre-attack-data
```

---

本家：
Please see my [blog](https://www.remyjaspers.com/blog/mitre_attack_mcp_server/) for more information and examples.

## Credits

* [MITRE ATT&CK](https://attack.mitre.org/) - Knowledge base of adversary tactics and techniques
* [MITRE ATT&CK Python](https://github.com/mitre-attack/mitreattack-python) - Python library to interact with the knowledge base
* [ATT&CK Navigator](https://github.com/mitre-attack/attack-navigator) - Tool for visualizing ATT&CK matrices
* [Anthropic](https://www.anthropic.com/) - Developers of the Model-Context Protocol

> Created by [Remy Jaspers](https://github.com/stoyky)
