# Use Java 21 base image
FROM eclipse-temurin:21-jdk

# Set working directory
WORKDIR /app

# Copy pre-built JAR and config file
COPY pdfreader-0.0.1-SNAPSHOT.jar app.jar
COPY application.yml /app/config/application.yml

# ✅ Copy the data folder (your PDFs and index dirs)
COPY data/ /app/data/

# Expose the port Spring Boot runs on
EXPOSE 9090

# Point Spring to the external config
ENV SPRING_CONFIG_LOCATION=classpath:/,file:/app/config/

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]