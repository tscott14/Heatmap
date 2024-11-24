# Use the official Alpine Linux image as the base image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache \
    git \
    bash \
    curl \
    busybox \
    openssh-client

# Set the working directory
WORKDIR /app

# Copy the application files to the container
COPY . .

# Run the script to edit and upload git changes
CMD ["bash", "app/setup.sh"]
