※事前準備
docker desktopを起動しておく

①PowerShellを起動
作業ディレクトリに移動

```cd E:\docker\modern-dev\backend```

②イメージビルド

```docker image build -t modern-dev-backend-app .```

③コンテナ起動

```docker container run --name modern-dev-backend-app -d -p 8080:80 httpd```
```docker run -d -p 8080:8080 --name backend-container modern-dev-backend-app```

その他
・dockerコンテナに接続

```docker exec -it backend-container /bin/bash```
