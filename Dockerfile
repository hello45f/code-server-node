# Use Ubuntu as base
FROM ubuntu:22.04

# Avoid timezone prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    sudo \
    nano \
    build-essential

# Install Node.js 18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# Install code-server (VS Code in browser)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install nodemon globally
RUN npm install -g nodemon

# Create workspace folder
RUN mkdir -p /workspace

# Set working directory
WORKDIR /workspace

# Copy startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# Expose port
EXPOSE 8080

# Start code-server
CMD ["/startup.sh"]
