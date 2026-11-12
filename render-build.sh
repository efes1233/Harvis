#!/usr/bin/env bash
set -e

echo "JARVIS PRO ZIP EXTRACTION"

for file in assets.zip docs.zip scripts.zip server.zip shared.zip web.zip; do
    if [ -f "$file" ]; then
        echo "Extracting $file"
        unzip -o "$file" -d .
    else
        echo "WARNING: $file not found"
    fi
done

echo "Checking frontend..."

if [ ! -f "web/src/main.tsx" ]; then
    echo "ERROR: web/src/main.tsx missing"
    find . -maxdepth 5 -type f | head -200
    exit 1
fi

echo "Installing dependencies..."
npm install --include=dev

echo "Building JARVIS..."
npm run build

echo "BUILD COMPLETE"
