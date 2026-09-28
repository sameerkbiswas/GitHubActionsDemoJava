# Use the official Eclipse Temurin Java 25 runtime base image
FROM eclipse-temurin:25-jre
WORKDIR /app

# Create a non-root user to avoid running the container as root
RUN useradd -m appuser && chown -R appuser /app
USER appuser

# Copy your pre-built JAR file into the container
COPY target/github-actions-demo.jar app.jar

# Standard JVM container memory optimizations
ENV JAVA_OPTS="-XX:MaxRAMPercentage=75.0"

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
