# docker_web_test


#### build

```shell
$ docker build -t web:1 --platform linux/amd64 .
```

#### docker compose

```shell
$ docker compose up -d
```


#### configure

```shell
$ 1_configure.sh
```

#### exec

```shell
$ docker exec -it web /bin/bash
```

#### wildfly 관리콘솔 접속주소 
http://127.0.0.1:9990/console/index.html