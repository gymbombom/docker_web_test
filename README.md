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