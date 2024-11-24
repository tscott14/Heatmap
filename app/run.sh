#!/bin/bash

# Function to perform a git commit
function run_commit {
  # Write the current timestamp to a new file in the commits directory
  timestamp=$(date +%s)
  filename=$(date +%Y-%m-%d_%H-%M-%S)

  echo $timestamp > "commits/$filename.txt"

  # Add changes to git, commit with a message, and push to the repository
  git add commits/*.txt
  git commit -m "Commit $(date +%Y-%m-%d)"
  git push
}

# Function to run the commit function a random number of times
function run_random {
  for i in $(seq $((RANDOM % 5 + 1))); do
    echo "Attempting commit..."
    run_commit

    # Calculate the sleep time in seconds
    sleep_time=$((30 * 60 + RANDOM % (240 - 30 + 1) * 60))

    # Announce the wait period
    echo "Waiting $(($sleep_time / 60)) minutes..."

    # Sleep for calculated time
    sleep $sleep_time
  done
}

# Run the commit function a random number of times
  echo "Running commit..."
run_random