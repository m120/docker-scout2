# docker-scout2

## Description
Scout2 Docker

AWSのSecurity auditing tool *Scout2* を dockernize   
https://github.com/nccgroup/Scout2


## Build and Run
### Build
- git clone
  ```
  $ git clone https://github.com/m120/docker-scout2.git
  ```

- docker build
  ```
  $ docker build -t scout2 .
  ```

### Run
```
$ docker run -it --rm -v ~/.aws:/root/.aws:ro -v ${PWD}:/artifact -e aws_profile="AWSのプロファイル名" scout2:latest
```
- 結果は _scout2-report_ ディレクトリに出力されるので、htmlファイルをブラウザーで開く
- Scout2のオプションを付与したい場合 (ex: --debug )
  ```
    $ docker run -it --rm -v ~/.aws:/root/.aws:ro -v ${PWD}:/artifact -e aws_profile="AWSのプロファイル名" -e argv=--debug scout2:latest
  ```

## scout2-report ディレクトリを nginx でみたいなら。
```
 $ docker run -it --rm --name scout2-nginx -d -p 8082:80 -v ${PWD}/nginx_conf:/etc/nginx/sites-enabled/:ro  -v ${PWD}/scout2-report:/var/www/html/:ro nginx
```
- docker実行後 `http://127.0.0.1:8082`
- Scout2実行時のAWSプロファイル名のディレクトリの中のhtmlファイルをクリック


