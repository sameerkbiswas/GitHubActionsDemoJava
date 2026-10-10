# --- Stage 1: Build the application ---
FROM eclipse-temurin:25 AS builder
WORKDIR /build

# Copy the build configuration and source code
COPY pom.xml .
COPY src ./src

# Install Maven
RUN apt update && apt install -y maven && rm -rf /var/lib/apt/lists/*

# Compile and package the application
RUN mvn clean package -DskipTests

# --- Stage 2: Create the lightweight runtime image ---
FROM eclipse-temurin:8u504-b01-jre-ubi10-minimal
WORKDIR /app

# Create a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Copy the compiled JAR file from the builder stage
COPY --from=builder /build/target/*.jar github-actions-demo-0.0.1.jar

# Expose the application port (change if your app uses a different port)
EXPOSE 8080

# Configure production memory allocations using Java environment variables
ENV JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=80.0 -XX:InitialRAMPercentage=80.0"

# Execute the application
ENTRYPOINT ["java", "-jar", "github-actions-demo-0.0.1.jar"]
