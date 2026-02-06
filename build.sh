#!/bin/bash

# Netlify Build Script for Flutter Web

echo "🚀 Starting Flutter Web Build for Netlify..."

# Install Flutter
if ! command -v flutter &> /dev/null; then
    echo "📦 Installing Flutter..."
    git clone https://github.com/flutter/flutter.git -b stable --depth 1
    export PATH="$PATH:`pwd`/flutter/bin"
    
    # Disable analytics
    flutter config --no-analytics
fi

# Get Flutter version
echo "📌 Flutter version:"
flutter --version

# Enable web
echo "🌐 Enabling web support..."
flutter config --enable-web

# Clean and get dependencies
echo "📦 Getting dependencies..."
flutter clean
flutter pub get

# Build web
echo "🔨 Building web app..."
flutter build web --release --web-renderer canvaskit

echo "✅ Build complete!"
echo "📁 Output directory: build/web"
