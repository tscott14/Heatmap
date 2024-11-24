#!/bin/bash
echo "Running setup script..."

# Execute run.sh at 3am everyday
echo "Installing cron schedule..."
echo "0 3 * * * /app/run.sh" > /etc/crontabs/root
chmod 0644 /etc/crontabs/root

# start crond
echo "Starting crond..."
crond -f -l 8

# Create entries directory if it does not exist
if [ ! -d "commits" ]; then
    echo "Creating commits directory..."
  mkdir commits
fi