# apk-cache

![circleci][circleci]

Simple apk package cache for Alpine Linux

# Quickstart

Start apk-cache container:
```bash
docker run -d --name=apk-cache quay.io/vektorcloud/apk-cache:latest
```

After apk-cache is up, start any subsquent containers with a link to the cache:
```bash 
docker run -ti --link apk-cache:dl-cdn.alpinelinux.org alpine:latest /bin/sh
```

To alternatively avoid having to link every running container, publish port 80 to the host:
```bash
docker run -d -p 80:80 --name=apk-cache quay.io/vektorcloud/apk-cache:latest
```

and override resolution of dl-cdn.alpinelinux.org using the IP of the Docker host via dnsmasq or the docker run option `--add-host dl-cdn.alpinelinux.org:<HOST-IP>`

[circleci]: https://img.shields.io/circleci/project/github/vektorcloud/apk-cache.svg "apk-cache"
