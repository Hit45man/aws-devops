#!/bin/bash

# Get a list of all running Docker containers
containers=$(docker ps -aq)

# If there are any containers running
if [ -n "$containers" ]; then
  # Stop all running containers
  docker stop $(docker ps -aq)

  # Delete all stopped containers
  docker rm $(docker ps -aq -f status=exited)

  echo "All Docker containers stopped and deleted."
else
  echo "No Docker containers found."
fi
