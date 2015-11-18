# apk-cache

Simple apk package cache for Alpine Linux

# Quickstart

Start apk-cache container:
```bash
docker run -d --name=apk-cache bcicen/apk-cache
```

After apk-cache is up, start any subsquent containers with a link to the cache:
```bash 
docker run -ti --link apk-cache:dl-4.alpinelinux.org alpine:latest /bin/sh
```

To alternatively avoid having to link every running container, publish port 80 to the host:
```bash
docker run -d -p 80:80 --name=apk-cache bcicen/apk-cache
```

and overwrite resolution of dl-4.alpinelinux.org using the IP of the Docker host via dnsmasq or the docker run option `--add-host dl-4.alpinelinux.org:<HOST-IP>`
