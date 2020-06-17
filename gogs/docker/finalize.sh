#!/bin/sh
# Finalize the build

set -x
set -e

# Create git user for Gogs
addgroup -S gogs
adduser -G gogs -H -D -g 'Gogs Git User' gogs -h /home/gogs -s /bin/bash && usermod -p '*' gogs && passwd -u gogs
echo "export GOGS_CUSTOM=${GOGS_CUSTOM}" >> /etc/profile

# Final cleaning
rm -rf /app/gogs/build
rm /app/gogs/docker/finalize.sh
rm /app/gogs/docker/nsswitch.conf
rm /app/gogs/docker/README.md
