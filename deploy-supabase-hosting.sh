#!/bin/bash

echo "🚀 Deploying to Supabase Hosting..."
echo ""

# Check if Supabase CLI is installed
if ! command -v supabase &> /dev/null; then
    echo "❌ Supabase CLI not found!"
    echo "📦 Installing Supabase CLI via Homebrew..."
    brew install supabase/tap/supabase
    
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install Supabase CLI"
        echo "💡 Try manually: brew install supabase/tap/supabase"
        exit 1
    fi
fi

echo "✅ Supabase CLI found"
echo ""

# Build Flutter web
echo "📦 Building Flutter web app..."
flutter build web --release

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    echo "💡 Check Flutter errors above"
    exit 1
fi

echo "✅ Build successful!"
echo ""

# Check if build/web exists
if [ ! -d "build/web" ]; then
    echo "❌ build/web directory not found!"
    exit 1
fi

# Deploy to Supabase Hosting
echo "🌐 Deploying to Supabase Hosting..."
echo ""

supabase hosting deploy build/web

if [ $? -eq 0 ]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "✅ Deployment Successful!"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "🌐 Your portfolio is live at:"
    echo "   https://bsnvsraqmdzidfihgwvn.supabase.co"
    echo ""
    echo "📱 Share this link:"
    echo "   • LinkedIn profile"
    echo "   • Resume"
    echo "   • Email signature"
    echo "   • GitHub README"
    echo ""
    echo "🔄 To update: Run this script again"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
    echo ""
    echo "❌ Deployment failed!"
    echo ""
    echo "💡 Troubleshooting:"
    echo "   1. Check if logged in: supabase login"
    echo "   2. Check if linked: supabase link --project-ref bsnvsraqmdzidfihgwvn"
    echo "   3. Try manual deploy: supabase hosting deploy build/web"
    exit 1
fi
