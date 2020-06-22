FROM maven:3.6.0-jdk-11-slim AS build
COPY src /Users/dharanianimireddy/CloudDemo/src
COPY pom.xml /Users/dharanianimireddy/CloudDemo
RUN mvn -f /Users/dharanianimireddy/CloudDemo/pom.xml clean package

FROM openjdk:8-jdk-alpine
COPY --from=build /Users/dharanianimireddy/CloudDemo/target/gs-spring-boot-docker-0.1.0.jar /usr/local/lib/CloudDemo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/CloudDemo.jar"]
