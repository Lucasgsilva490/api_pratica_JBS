#
# Build Package
#
FROM maven:3.8.3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:17-jdk
COPY --from=build /target/mudi-0.0.1-SNAPSHOT.jar JBS-POC.jar
EXPOSE 8181
ENTRYPOINT ["java","-jar","JBS-POC.jar"]
