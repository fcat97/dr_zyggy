#!/bin/bash

# Check if the argument 'text' is provided
if [ -z "$1" ]; then
  echo "Usage: $0 '<text>'"
  exit 1
fi

TEXT="$1"

# Activate the virtual environment located inside the .venv directory
source .venv/bin/activate

# Run the gtts-cli command to generate speech in Bengali and save as output.mp3
gtts-cli "$TEXT" -l bn | ffplay -nodisp -autoexit -hide_banner -

# Deactivate the virtual environment
deactivate
