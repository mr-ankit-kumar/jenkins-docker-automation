FROM openjdk:8
EXPOSE 8080
ARG JAR_FILE=/var/lib/jenkins/workspace/devops-docker-cicd/target/devops-integration.jar

COPY ${JAR_FILE} app.jar
ADD target/devops-integration.jar devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]
