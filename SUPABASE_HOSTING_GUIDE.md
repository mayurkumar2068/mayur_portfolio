# 🚀 Supabase Hosting - Complete Guide

## ✅ Supabase Hosting (Proper Way)

Supabase has a **Static Hosting** feature specifically for web apps - FREE!

---

## 📋 Prerequisites

- Node.js installed
- Supabase account
- Flutter project built

---

## 🎯 Step-by-Step Deployment

### Step 1: Install Supabase CLI

#### macOS (Homebrew - Recommended)

```bash
brew install supabase/tap/supabase
```

#### Linux

```bash
brew install supabase/tap/supabase
```

#### Windows

```powershell
scoop bucket add supabase https://github.com/supabase/scoop-bucket.git
scoop install supabase
```

#### Alternative: Use npx (No Installation)

```bash
# Use directly without installation
npx supabase login
npx supabase link --project-ref bsnvsraqmdzidfihgwvn
npx supabase hosting deploy build/web
```

**Verify Installation:**

```bash
supabase --version
```

### Step 2: Login to Supabase

```bash
supabase login
```

This will open browser - login with your Supabase account.

### Step 3: Link Your Project

```bash
# Initialize Supabase in your project
supabase init

# Link to your Supabase project
supabase link --project-ref bsnvsraqmdzidfihgwvn
```

### Step 4: Build Flutter Web

```bash
flutter build web --release
```

### Step 5: Deploy to Supabase Hosting

```bash
supabase hosting deploy build/web
```

### Step 6: Get Your Live URL

After deployment, you'll get URL like:
```
https://bsnvsraqmdzidfihgwvn.supabase.co
```

---

## 🔄 Complete Deployment Script

Create `deploy-supabase-hosting.sh`:

```bash
#!/bin/bash

echo "🚀 Deploying to Supabase Hosting..."

# Build Flutter web
echo "📦 Building Flutter web app..."
flutter build web --release

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"

# Deploy to Supabase Hosting
echo "🌐 Deploying to Supabase Hosting..."
supabase hosting deploy build/web

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Deployment successful!"
    echo ""
    echo "🌐 Your portfolio is live at:"
    echo "https://bsnvsraqmdzidfihgwvn.supabase.co"
    echo ""
else
    echo "❌ Deployment failed!"
    exit 1
fi
```

Make it executable:
```bash
chmod +x deploy-supabase-hosting.sh
```

---

## 🎯 Quick Deploy Commands

### One-time Setup
```bash
# Install CLI (macOS)
brew install supabase/tap/supabase

# Login
supabase login

# Initialize
supabase init

# Link project
supabase link --project-ref bsnvsraqmdzidfihgwvn
```

### Deploy (Every time)
```bash
# Build and deploy
flutter build web --release
supabase hosting deploy build/web
```

Or use the script:
```bash
./deploy-supabase-hosting.sh
```

---

## 🔄 Setup CI/CD with GitHub Actions

Update `.github/workflows/supabase-deploy.yml`:

```yaml
name: Deploy to Supabase Hosting

on:
  push:
    branches:
      - main
      - master
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.24.0'
          channel: 'stable'

      - name: Get Dependencies
        run: flutter pub get

      - name: Build Web
        run: flutter build web --release

      - name: Install Supabase CLI
        run: npm install -g supabase

      - name: Deploy to Supabase Hosting
        env:
          SUPABASE_ACCESS_TOKEN: ${{ secrets.SUPABASE_ACCESS_TOKEN }}
          SUPABASE_PROJECT_ID: bsnvsraqmdzidfihgwvn
        run: |
          supabase link --project-ref $SUPABASE_PROJECT_ID
          supabase hosting deploy build/web

      - name: Deployment Success
        run: |
          echo "✅ Deployment successful!"
          echo "🌐 Portfolio live at: https://bsnvsraqmdzidfihgwvn.supabase.co"
```

---

## 🔑 Setup GitHub Secrets for CI/CD

1. Get Supabase Access Token:
```bash
supabase login
# Copy the access token shown
```

2. Add to GitHub:
   - Go to repository **Settings**
   - **Secrets and variables** → **Actions**
   - **New repository secret**
   - Name: `SUPABASE_ACCESS_TOKEN`
   - Value: Your access token

---

## 📝 Configuration File

Create `supabase/config.toml`:

```toml
[hosting]
enabled = true
port = 54321

[hosting.headers]
"/*" = [
  "Cache-Control: public, max-age=3600",
  "X-Frame-Options: SAMEORIGIN",
  "X-Content-Type-Options: nosniff"
]
```

---

## 🌐 Custom Domain (Optional)

### Add Custom Domain

1. Go to Supabase Dashboard
2. **Settings** → **Hosting**
3. Click **"Add custom domain"**
4. Enter your domain: `mayurbobade.com`
5. Add DNS records as shown
6. Wait for verification

### DNS Configuration

Add these records to your domain:
```
Type: CNAME
Name: @
Value: bsnvsraqmdzidfihgwvn.supabase.co
```

---

## 🔧 Troubleshooting

### Issue: `supabase: command not found`
```bash
# Reinstall CLI (macOS)
brew install supabase/tap/supabase

# Or use npx (no installation)
npx supabase login
```

### Issue: Login fails
```bash
# Clear cache and retry
rm -rf ~/.supabase
supabase login
```

### Issue: Project not linked
```bash
# Link manually
supabase link --project-ref bsnvsraqmdzidfihgwvn
```

### Issue: Deployment fails
```bash
# Check if build exists
ls -la build/web

# Rebuild
flutter clean
flutter build web --release

# Deploy again
supabase hosting deploy build/web
```

---

## ✅ Deployment Checklist

- [ ] Supabase CLI installed
- [ ] Logged in to Supabase
- [ ] Project initialized
- [ ] Project linked
- [ ] Flutter web built
- [ ] Deployed successfully
- [ ] Portfolio accessible at URL
- [ ] All features working

---

## 🎯 Your Portfolio URLs

**Main URL**:
```
https://bsnvsraqmdzidfihgwvn.supabase.co
```

**With Custom Domain** (if configured):
```
https://mayurbobade.com
```

---

## 📊 Deployment Status

Check deployment status:
```bash
supabase hosting status
```

View logs:
```bash
supabase hosting logs
```

---

## 🔄 Update Portfolio

Whenever you make changes:

```bash
# Make your changes
# Then:

flutter build web --release
supabase hosting deploy build/web
```

Or use the script:
```bash
./deploy-supabase-hosting.sh
```

---

## 💡 Pro Tips

1. **Cache Busting**: Supabase handles automatically
2. **SSL**: Automatic HTTPS
3. **CDN**: Built-in CDN for fast loading
4. **Rollback**: Can rollback to previous versions
5. **Analytics**: Check Supabase Dashboard

---

## 🚀 Quick Start Summary

```bash
# One-time setup (macOS)
brew install supabase/tap/supabase
supabase login
supabase init
supabase link --project-ref bsnvsraqmdzidfihgwvn

# Deploy
flutter build web --release
supabase hosting deploy build/web

# Your portfolio is live!
# https://bsnvsraqmdzidfihgwvn.supabase.co
```

---

## 📱 Share Your Portfolio

After deployment:
- LinkedIn: Add to profile
- Resume: Include URL
- Email: Add to signature
- GitHub: Add to README
- Twitter/X: Add to bio

**Your Live URL**:
```
https://bsnvsraqmdzidfihgwvn.supabase.co
```

---

**Ready to deploy? Run the commands above!** 🎉
