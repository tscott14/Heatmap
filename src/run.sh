#!/bin/bash

#!/bin/bash

# Check if GIT_USERNAME is set
if [ -z "$GIT_USERNAME" ]; then
  echo "Error: GIT_USERNAME is not set."
  exit 1
fi

# Check if GIT_PASSWORD is set
if [ -z "$GIT_PASSWORD" ]; then
  echo "Error: GIT_PASSWORD is not set."
  exit 1
fi

# Create entries directory if it does not exist
if [ ! -d "entries" ]; then
  mkdir entries
fi

# Function to perform a git commit
function run_commit {
  # Write the current timestamp to a new file in the entries directory
  timestamp=$(date +%s)
  filename=$(date +%Y-%m-%d_%H-%M-%S)

  echo $timestamp > "entries/$filename.txt"

  # Add changes to git, commit with a message, and push to the repository
  git add entries/*.txt
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
run_random