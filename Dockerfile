FROM artifactory.wma.chs.usgs.gov/docker-official-mirror/debian:stable

LABEL maintainer="gw-w_vizlab@usgs.gov"

# Run updates and install curl
RUN apt-get update && \
      apt-get upgrade -y && \
      apt-get install curl -y && \
      apt-get purge -y --auto-remove && \
      apt-get clean

# Enable the NodeSource repository and install nodejs version 24 (current LTS as of December 2025)
RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - &&\
      apt-get install -y nodejs

# Create temp directory for building viz app
ARG VITE_APP_TITLE="project"
RUN mkdir -p /tmp/$VITE_APP_TITLE

# Copy source code
WORKDIR /tmp/$VITE_APP_TITLE
COPY . .
# Set environment variables for build target and tile source and then run config.sh
ARG BUILD_DEST="test"
ARG VUE_BUILD_MODE="test"
ENV E_BUILD_DEST=$BUILD_DEST
ENV E_VUE_BUILD_MODE=$VUE_BUILD_MODE

# Build the Vue app.
RUN npm install
RUN chmod +x ./build.sh && ./build.sh

