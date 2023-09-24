# Use the official Maven image with JDK 8
FROM maven:3.8.1-jdk-8

# Set the working directory
WORKDIR /app

# Setup the git repo
RUN git clone https://github.com/TestLeafInc/jenkins-pipeline /app

# Change working directory
WORKDIR /app/leafhub

# Setup the command to run maven as spring-boot app
CMD ["mvn","spring-boot:run"]

#Expose port
EXPOSE 80
