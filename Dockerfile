FROM maven:3-openjdk-17-slim as build
ADD . /app
WORKDIR /app
RUN rm -rf src/main/resources/application.properties
RUN mvn clean package -DskipTests=true

FROM eclipse-temurin:18-jre-alpine
LABEL maintainer="github.com/swissbuechi"
WORKDIR /app
ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk --no-cache add curl

RUN addgroup --gid 1000 -S app && adduser --uid 1000 -S app -G app
RUN chown -R app:app /app
USER app

COPY --from=build /app/target/app.jar app.jar
EXPOSE 8080
ENTRYPOINT [ "java","-XX:+UseSerialGC","-Xss512k","-XX:MaxRAM=150m","-Djava.security.egd=file:/dev/./urandom", "-jar", "./app.jar" ]