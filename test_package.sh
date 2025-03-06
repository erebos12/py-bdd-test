#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e  

# Create a virtual environment
python3 -m venv venv  

# Activate the virtual environment
source venv/bin/activate  

# Define the package name
package_name="py-bdd-test"

# Clear the pip cache and uninstall any existing version of the package
pip3 cache purge
pip3 uninstall -y $package_name 

# Install the latest version from PyPI
pip3 install --upgrade $package_name

# Show package details
pip3 show $package_name 

# ✅  Run the CLI command directly
echo "🚀 Running list-bdd-steps command..."
list-bdd-steps

# Deactivate the virtual environment
deactivate

