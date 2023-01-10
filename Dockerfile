FROM maven:3-openjdk-17-slim as build
ADD . /app
WORKDIR /app
RUN rm -rf src/main/resources/application.properties
RUN mvn clean package -DskipTests=true

FROM ibm-semeru-runtimes:open-18-jre
LABEL maintainer="github.com/swissbuechi"
WORKDIR /app
ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get install curl -y

RUN useradd --uid 1000 --user-group app
RUN chown -R app:app /app
USER app

COPY --from=build /app/target/app.jar app.jar
EXPOSE 8080
HEALTHCHECK CMD curl --fail --silent localhost:8080/actuator/health | grep UP || exit 1
ENTRYPOINT [ "java","-XX:+UseSerialGC","-Xss512k","-XX:MaxRAM=150m","-Djava.security.egd=file:/dev/./urandom", "-jar", "./app.jar" ]