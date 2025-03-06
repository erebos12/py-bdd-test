#!/bin/bash

set -e  # Exit on any error

# Function to increment the version number
increment_version() {
    local version=$1
    local IFS=.
    read -ra parts <<< "$version"
    parts[2]=$((parts[2] + 1))  # Increment PATCH version
    echo "${parts[0]}.${parts[1]}.${parts[2]}"
}

# Get the latest tag
latest_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "0.0.0")
echo "Latest tag: $latest_tag"

# Generate new version
new_version=$(increment_version "$latest_tag")
echo "New version: $new_version"

# Update version in setup.py
echo "Updating setup.py..."
sed -i.bak "s/version=['\"]$latest_tag['\"]/version='$new_version'/" setup.py
rm setup.py.bak

# Commit the change
git add setup.py
git commit -m "Bump version to $new_version"

# Create and push new tag
git tag -a "$new_version" -m "Release version $new_version"
git push origin "$new_version"

echo "✅ Version updated to $new_version and tag created."
