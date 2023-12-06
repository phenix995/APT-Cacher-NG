FROM ubuntu:latest

# Update distro
RUN apt update && apt dist-upgrade -y
# Install necessary package and clean up
RUN apt install -y apt-cacher-ng wget avahi-daemon ca-certificates apt-transport-https lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Persistent file (Package)
VOLUME ["/var/cache/apt-cacher-ng"]

# Copy a custom configuration file if needed
COPY acng.conf /etc/apt-cacher-ng/

# Create a startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# Expose the apt-cacher-ng port
EXPOSE 3142/tcp

# Health check
HEALTHCHECK --interval=10s --timeout=2s --retries=3 \
    CMD wget -q -t1 -O /dev/null http://localhost:3142/acng-report.html || exit 1

# Set the entrypoint to the startup script
ENTRYPOINT ["/startup.sh"]
