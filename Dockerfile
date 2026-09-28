FROM openjdk:25-jdk-slim

WORKDIR /app

COPY . .

RUN ./gradlew build

EXPOSE 8080

CMD ["java", "-jar", "build/libs/GitHubActionsDemoJava-0.0.1-SNAPSHOT.jar"]

