FROM maven:3.8.5-openjdk-17-slim AS buid
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=buid /target/eureka-server-0.0.1-SNAPSHOT.jar eureka-server.jar
EXPOSE 8761
ENTRYPOINT [ "java","-jar","eureka-server.jar" ]