from sourcemation/jdk-25

# Copy your Java application JAR file into the image
COPY GitHubActionsDemoJava-0.0.1-SNAPSHOT.jar /app/GitHubActionsDemoJava-0.0.1-SNAPSHOT.jar
# Set the working directory
WORKDIR /app
# Run the Java application
CMD ["java", "-jar", "GitHubActionsDemoJava-0.0.1-SNAPSHOT.jar"]
