#!/bin/bash
set -e

echo "🚀 Starting Flutter Web Build for Netlify..."

# Install Flutter if not present
if [ ! -d "flutter" ]; then
    echo "📦 Cloning Flutter SDK version 3.38.9..."
    git clone https://github.com/flutter/flutter.git -b 3.38.9 --depth 1
fi

# Add Flutter to PATH
export PATH="$PATH:$PWD/flutter/bin"

# Precache Flutter
echo "📦 Precaching Flutter..."
flutter precache --web

# Disable analytics
flutter config --no-analytics

# Get Flutter version
echo "📌 Flutter version:"
flutter --version

# Enable web
echo "🌐 Enabling web support..."
flutter config --enable-web

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Build web
echo "🔨 Building web app..."
flutter build web --release --web-renderer canvaskit

# Verify build output
if [ -d "build/web" ]; then
    echo "✅ Build complete!"
    echo "📁 Build output:"
    ls -la build/web
else
    echo "❌ Build failed - build/web directory not found"
    exit 1
fi
