#!/bin/bash

# Define the name of the virtual environment directory
VENV_DIR=".venv"

# Check if the virtual environment directory exists
if [ ! -d "$VENV_DIR" ]; then
    echo "Virtual environment not found. Creating a new one..."

    # Create a new virtual environment
    python3 -m venv "$VENV_DIR"
else
    echo "Virtual environment already exists."
fi

# Activate the virtual environment
echo "Activating the virtual environment..."
source "$VENV_DIR/bin/activate"

# Check if the requirements.txt file exists
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    pip install --upgrade pip  # Upgrade pip to the latest version
    pip install -r requirements.txt
else
    echo "requirements.txt not found. Please ensure the file exists in the current directory."
    deactivate
    exit 1
fi

# Inform the user that the setup is complete
echo "Dependencies installed successfully!"

# Optionally, you can leave the virtual environment activated, or deactivate it here:
# deactivate
