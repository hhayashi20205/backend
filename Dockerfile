# ベースイメージとしてUbuntuを使用
FROM ubuntu:latest

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Apacheのプロキシモジュールを有効にする
RUN a2enmod proxy proxy_http

# Node.jsとnpmをインストール
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# 作業ディレクトリを作成
WORKDIR /usr/src/app

# Node.jsアプリケーションの依存関係をコピーしてインストール
COPY modern-dev-backend-app/package*.json ./
RUN npm install

# アプリケーションのソースコードをコピー
COPY modern-dev-backend-app/. .

# Apacheの設定ファイルをコピー
COPY apache.conf /etc/apache2/sites-available/000-default.conf

# ポートの設定
EXPOSE 8080

# ApacheとNode.jsアプリケーションを同時に実行するためのコマンド
CMD ["sh", "-c", "service apache2 start && node index.js"]
