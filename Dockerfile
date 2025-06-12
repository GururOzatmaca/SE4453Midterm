# Use official Python base image
FROM python:3.10-slim

# Install SSH server
RUN apt-get update && apt-get install -y openssh-server

# Create SSH directory and set root password (demo use only!)
RUN mkdir /var/run/sshd && echo 'root:Azure123!' | chpasswd

# Allow root login
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Set work directory
WORKDIR /app

# Copy app code
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose ports: 22 for SSH, 8000 for Python web server
EXPOSE 22 8000

# Copy and allow running the init script
COPY init.sh /init.sh
RUN chmod +x /init.sh

# Start SSH and app
CMD ["/init.sh"]

