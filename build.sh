#!/bin/bash

# Netlify Build Script for Flutter Web

echo "🚀 Starting Flutter Web Build for Netlify..."

# Install Flutter
if ! command -v flutter &> /dev/null; then
    echo "📦 Installing Flutter..."
    git clone https://github.com/flutter/flutter.git -b stable --depth 1
    export PATH="$PATH:`pwd`/flutter/bin"
fi

# Get Flutter version
flutter --version

# Enable web
flutter config --enable-web

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Build web
echo "🔨 Building web app..."
flutter build web --release

echo "✅ Build complete!"
