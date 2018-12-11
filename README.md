# dependency-check-cli
OWASP Dependency Check CLI Docker Container

## Repository description

This repository contain the Dockerfile to create container with OWASP Dependency Check CLI utility

## Docker build

### 1. Build docker container

```console
$ docker build --rm -t local/dependency-check-cli .
```

### 2. Run container

```console
$ docker run -it --rm --name dependency-check-cli local/dependency-check-cli
```

Then you can use script dependency-check.sh to start scan
