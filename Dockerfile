# Use Ubuntu as the base image
FROM ubuntu:20.04

# Switch to root user
USER root

# Update and install essential tools
RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget \
    gnupg \
    openjdk-11-jdk \
    python3 \
    python3-pip \
    --fix-missing && \
    apt-get clean

# Install Python libraries
RUN pip3 install pandas matplotlib

# Add Jenkins key and repository
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - && \
    echo "deb http://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list && \
    apt-get update && \
    apt-get install -y jenkins && \
    apt-get clean

# Expose Jenkins ports
EXPOSE 8080 50000

# Start Jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]