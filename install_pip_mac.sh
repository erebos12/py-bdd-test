#!/bin/bash

# Check if pip is already installed
if command -v pip3 &>/dev/null; then
    echo "✅ pip is already installed: $(pip3 --version)"
    exit 0
fi

echo "⚠️ pip is not installed. Installing now..."

# Install Python and pip using Homebrew if available
if command -v brew &>/dev/null; then
    echo "🍺 Homebrew detected. Installing Python (which includes pip)..."
    brew install python3
else
    echo "⚠️ Homebrew not found. Installing pip manually..."
    
    # Download get-pip.py and install pip
    curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
    rm get-pip.py  # Clean up
fi

# Verify pip installation
if command -v pip3 &>/dev/null; then
    echo "✅ pip successfully installed: $(pip3 --version)"
else
    echo "❌ pip installation failed."
    exit 1
fi

