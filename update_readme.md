#!/bin/bash

set -e  # Exit on error

# Define paths
README_FILE="README.md"
TEMP_FILE="temp_steps.md"

# Run list_steps.py and save output
echo "🚀 Extracting BDD step definitions..."
echo -e "\n## 🛠 Available BDD Step Definitions\n" > "$TEMP_FILE"
python3 -m py_bdd_test.list_steps >> "$TEMP_FILE"

# Remove old step definitions from README.md
sed -i.bak '/## 🛠 Available BDD Step Definitions/,$d' "$README_FILE"

# Append new step definitions
cat "$TEMP_FILE" >> "$README_FILE"
rm "$TEMP_FILE" "$README_FILE.bak"

echo "✅ README.md updated with latest BDD steps!"

