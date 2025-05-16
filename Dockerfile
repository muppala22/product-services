FROM eclipse-temurin:11-jre-focal
WORKDIR /app
COPY build/libs/product-services.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]