# Docker Tinyproxy ![alt text](https://raw.githubusercontent.com/daniel-middleton/docker-tinyproxy/master/other/banu_logo.png "Banu!")

A quick and easy Dockerised Tinyproxy with configurable ACL.

Find it on [GitHub](https://github.com/monokal/docker-tinyproxy).

Find it on [DockerHub](https://hub.docker.com/repository/docker/monokal/tinyproxy).

### Usage
---
##### Running a new Tinyproxy container

```bash
#Usage:
docker run -d --name='tinyproxy' -p <Host_Port>:8888 --env BASIC_AUTH_USER=<username> --env BASIC_AUTH_PASSWORD=<password> --env TIMEOUT=<timeout> cahato/alpine_tinyproy:3.12_1.10 <ACL>

#- Set <Host_Port> to the port you wish the proxy to be accessible from.
#- Set <ACL> to 'ANY' to allow unrestricted proxy access, or one or more space seperated IP/CIDR addresses for tighter security.
#- Basic auth is optional.
#- Timeout is optional.

# Examples:
docker run -d --name='tinyproxy' -p 6666:8888 cahato/alpine_tinyproy:3.12_1.10 ANY
docker run -d --name='tinyproxy' -p 7777:8888 cahato/alpine_tinyproy:3.12_1.10 87.115.60.124
docker run -d --name='tinyproxy' -p 8888:8888 cahato/alpine_tinyproy:3.12_1.10 10.103.0.100/24 192.168.1.22/16
```

### Monitoring
---
##### Logs
`docker logs -f tinyproxy` will display a following tail of `/var/log/tinyproxy/tinyproxy.log`

##### Stats
Navigating to `http://tinyproxy.stats/` while connected to the proxy will display the Tinyproxy Stats page.

##### Filtering
Any Tinyproxy filter setting such as FilterDefaultDeny can be set as an environment variable.  You can map a filter file on the parent file system into the container for the proxy instance to use.

```bash

docker run -d --name='tinyproxy' -p 6666:8888 -v ~/filter-on-parent.conf:/etc/tinyproxy/filter.conf  --env Filter="/etc/tinyproxy/filter.conf" --env FilterDefaultDeny=Yes  cahato/alpine_tinyproy:3.12_1.10 ANY
```

### Reference

- This docker project was forked from monokal/docker-tinyproxy