#!/bin/bash

# Define the log file path
LOG_FILE="/home/docker/djando-react-postgresql-docker-template_update.log"

# Navigate to your repository
cd /home/docker/djando-react-postgresql-docker-template

# Fetch the latest updates from the remote repository
git fetch

# Check if there are any differences between your branch and the remote
if [ "$(git rev-parse HEAD)" != "$(git rev-parse @{u})" ]; then

    # Log the update time
    echo "Update started at $(date)" >> $LOG_FILE

    # Log the current commit
    echo "Current commit: $(git rev-parse HEAD)" >> $LOG_FILE

    # Pull the changes
    git pull

    # Rebuild the Docker containers (with Compose, or use `docker build` if preferred)
    docker-compose build

    # Restart the Docker containers
    docker-compose up -d

    # Log the new commit
    echo "Updated to commit: $(git rev-parse HEAD)" >> $LOG_FILE

    # Log the update completion time
    echo "Update completed at $(date)" >> $LOG_FILE

else
    # Log that no update was necessary
    echo "No update needed at $(date)" >> $LOG_FILE
fi