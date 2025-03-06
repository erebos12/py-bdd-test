#!/bin/bash

set -e  # Stoppt das Skript bei Fehlern

# Funktion zum Erhöhen der Patch-Version
increment_version() {
    local version=$1
    local IFS=.
    read -ra parts <<< "${version//v/}"  # Entferne "v" vor dem Parsen
    parts[2]=$((parts[2] + 1))  # Erhöhe PATCH-Version (X.Y.Z → X.Y.(Z+1))
    echo "${parts[0]}.${parts[1]}.${parts[2]}"
}

# Letztes Tag abrufen (Fallback auf 0.0.0 falls kein Tag vorhanden)
latest_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
echo "Latest tag: $latest_tag"

# Neue Version berechnen (ohne "v"-Präfix)
new_version=$(increment_version "$latest_tag")
echo "New version: $new_version"

# setup.py aktualisieren (Version ersetzen)
echo "Updating setup.py..."
sed -i.bak "s/version=['\"]$(echo $latest_tag | sed 's/v//g')['\"]/version='$new_version'/" setup.py
rm setup.py.bak

# Überprüfen, ob setup.py geändert wurde
if git diff --quiet setup.py; then
    echo "❌ No changes detected in setup.py. Exiting..."
    exit 1
fi

# Änderungen committen
git add setup.py
git commit -m "Bump version to $new_version"

# Neues Tag erstellen und pushen
git tag -a "v$new_version" -m "Release version $new_version"
git push origin "v$new_version"

echo "✅ Version updated to $new_version and tag created successfully."
