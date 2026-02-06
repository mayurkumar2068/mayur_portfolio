#!/bin/bash

echo "Deploying Portfolio to GitHub Pages..."

# Build the Flutter web app
echo "Building Flutter web app..."
flutter build web --release --base-href "/mayur_portfolio/"

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Build successful!"
    
    # Add all changes
    git add .
    
    # Commit with timestamp
    git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Push to GitHub
    git push origin main
    
    echo "Pushed to GitHub!"
    echo "GitHub Actions will deploy in 2-3 minutes..."
    echo "Your portfolio will be live at: https://mayurkumar2068.github.io/mayur_portfolio/"
else
    echo "Build failed! Please check errors above."
    exit 1
fi
