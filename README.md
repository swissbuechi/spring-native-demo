# Spring Native Sample Repo

A sample project to publish a Spring Native docker image with a GitHub action.

## Versions

- Java 17
- GraalVM: 22.1.0.r17-grl
- Spring Boot 2.7.0
- Spring Native 0.12.0


## Images

Dockerfile best practices:

- Minimal packages
- Separate user
- Fixed version
- Healthcheck

### JRE based image

`ghcr.io/swissbuechi/spring-native-demo:main`

Build with `eclipse-temurin` JVM to minimize ram usage

### Spring Native based image

`ghcr.io/swissbuechi/spring-native-demo:main-native`

## Run Demo

### Requirements

- Docker
- docker-compose

### Steps

1. Copy `docker-compose.yml` file
2. run `docker-compose up -d`

### Test

#### Native

`http://localhost:8080`

#### JRE

`http://localhost:8081`

## Performance

### Native
- Startup: 0.059s
- RAM: ~28MB
- Image size: 167.3MB

### JRE
- Startup: 1.964s
- RAM: ~80MB
- Image size: 166.1MB