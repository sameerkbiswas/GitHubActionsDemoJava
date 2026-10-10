FROM eclipse-temurin:25-jre

RUN groupadd --system appgroup && \
    useradd --system --gid appgroup --create-home appuser

USER appuser
WORKDIR /app
COPY /app/target/*.jar /app/github-actions-demo-0.0.1.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/github-actions-demo-0.0.1.jar"]