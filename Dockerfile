FROM maven:3.9.7-amazoncorretto-21 AS build
COPY . .
RUN mvn clean package

# Etapa de ejecución
FROM amazoncorretto:21.0.6-alpine
EXPOSE 8083
COPY --from=build /target/mexflix-ms-search-0.0.1-SNAPSHOT.jar mexflix-ms-search-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/mexflix-ms-search-0.0.1-SNAPSHOT.jar"]