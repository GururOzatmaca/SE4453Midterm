# Use official Python base image
FROM python:3.10-slim

# Install SSH server
RUN apt-get update && apt-get install -y openssh-server

# Set root password (demo/testing only — DO NOT use in production)
RUN echo 'root:Azure123!' | chpasswd

# Enable root SSH login + password authentication
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Create SSH runtime directory
RUN mkdir /var/run/sshd

# Set working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . .

# Install required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Make init script executable
RUN chmod +x ./init.sh

# Expose Flask and SSH ports
EXPOSE 80 22

# Start SSH and the Flask app when container starts
CMD ["./init.sh"]
