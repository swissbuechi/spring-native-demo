FROM softinstigate/graalvm-maven as build

ADD . /build
WORKDIR /build

RUN native-image --version
RUN java --version
RUN mvn --version

RUN rm -rf src/main/resources/application.properties
RUN mvn -Pnative package -DskipTests=true

#FROM alpine
FROM oraclelinux:8-slim
LABEL maintainer="github.com/swissbuechi"
ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app

RUN groupadd --gid 1000 app && adduser --uid 1000 -g app app
RUN chown -R app:app /app
USER app

COPY --from=build /build/target/demo demo
ENTRYPOINT [ "sh", "-c", "./demo" ]