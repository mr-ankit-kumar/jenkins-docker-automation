FROM openjdk:8
EXPOSE 8080
WORKDIR ./target
copy . .
