# Set the base image to adoptopenjdk (or any other Java base image)
# FROM registry.hub.docker.com/library/adoptopenjdk:11-jre-hotspot
# FROM docker.io/library/openjdk:8-jdk-alpine
FROM openjdk:8-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container
COPY target/es-producer.jar /app/es-producer.jar

# Copy other required files (e.g., producer.config, records.csv) into the container
COPY producer.config /app/producer.config
COPY records.csv /app/records.csv

# Set the entrypoint command to run the JAR file with the desired parameters
ENTRYPOINT ["java", "-jar", "es-producer.jar", "-t", "ace-events", "-T", "1000", "-n", "60000", "-r", "1024", "-c", "producer.config", "-f", "records.csv", "-d", ","]
