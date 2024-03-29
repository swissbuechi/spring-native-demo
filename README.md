# Spring Native Sample Repo

A sample project to publish a Spring Native docker image with a GitHub action.

## Versions

- Java 17
- Spring Boot 3

## Images

Dockerfile best-practices:

- Minimal packages
- Separate user
- Fixed versions
- Health-checks
- ~~Best-practice and Vulnerability scans provided by [Azure/container-scan](https://github.com/azure/container-scan/)~~

### JRE based image

`ghcr.io/swissbuechi/spring-native-demo:latest`

Built with `eclipse-temurin` JVM to minimize RAM usage

### Spring Native based image

`ghcr.io/swissbuechi/spring-native-demo:native`

## Run Demo

### Requirements

- Docker

### Steps

#### Docker

1. Download `compose.yml` file
2. Run `docker compose up`

#### Artifact native

Ubuntu

1. Download Artifact
2. `chmod +x ./<app>`
3. `./<app> -Dspring.config.location=<path to application.properties>`

### Test

#### Native

`http://localhost:8080`

#### JRE

`http://localhost:8081`

## Performance

### Native
- Startup: 0.059s
- RAM: ~28MB
- Image size: 76 MB

### JRE
- Startup: 1.964s
- RAM: ~80MB
- Image size: 201 MB