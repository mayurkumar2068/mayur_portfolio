#!/bin/bash

echo "🚀 Deploying to Supabase Storage..."

# Configuration - UPDATE THESE VALUES
SUPABASE_URL="https://bsnvsraqmdzidfihgwvn.supabase.co"
SUPABASE_KEY="YOUR_SERVICE_ROLE_KEY_HERE"
BUCKET_NAME="portfolio"

# Build Flutter web
echo "📦 Building Flutter web app..."
flutter build web --release

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"

# Upload to Supabase
echo "📤 Uploading to Supabase Storage..."

cd build/web

# Upload each file
for file in $(find . -type f); do
    filepath="${file#./}"
    echo "Uploading: $filepath"
    
    # Determine content type
    case "$filepath" in
        *.html) content_type="text/html" ;;
        *.css) content_type="text/css" ;;
        *.js) content_type="application/javascript" ;;
        *.json) content_type="application/json" ;;
        *.png) content_type="image/png" ;;
        *.jpg|*.jpeg) content_type="image/jpeg" ;;
        *.svg) content_type="image/svg+xml" ;;
        *.woff|*.woff2) content_type="font/woff2" ;;
        *) content_type="application/octet-stream" ;;
    esac
    
    # Upload file
    curl -X POST \
        "${SUPABASE_URL}/storage/v1/object/${BUCKET_NAME}/${filepath}" \
        -H "Authorization: Bearer ${SUPABASE_KEY}" \
        -H "Content-Type: ${content_type}" \
        -H "Cache-Control: public, max-age=31536000" \
        --data-binary "@$file" \
        --silent
done

cd ../..

echo ""
echo "✅ Deployment complete!"
echo ""
echo "🌐 Your portfolio is live at:"
echo "https://${SUPABASE_URL#https://}/storage/v1/object/public/${BUCKET_NAME}/index.html"
echo ""
echo "📱 Share this link with recruiters and on LinkedIn!"
