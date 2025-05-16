FROM gradle:7.6.1-jdk11 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM openjdk:11-jre-slim
EXPOSE 8081
COPY --from=build /home/gradle/src/build/libs/product-services.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]