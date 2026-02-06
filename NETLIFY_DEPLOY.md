# 🚀 Netlify Deployment Guide

## ✅ You Already Connected GitHub to Netlify!

Your Netlify project is ready:
- **Project Name**: darling-froyo-d375a6
- **Site ID**: 25a5757d-1fab-4b7b-959d-1b08880d039c

---

## 🎯 Configure Netlify Build Settings

### Option 1: Use Netlify Dashboard (Easiest)

1. Go to your Netlify project: https://app.netlify.com/sites/darling-froyo-d375a6
2. Click **Site configuration** → **Build & deploy**
3. Click **Edit settings**
4. Set these values:

```
Build command: ./build.sh
Publish directory: build/web
```

5. Click **Save**
6. Click **Trigger deploy** → **Deploy site**

---

### Option 2: Use netlify.toml (Automatic)

The `netlify.toml` file is already created in your repo. Just push to GitHub:

```bash
git add netlify.toml build.sh
git commit -m "Add Netlify configuration"
git push origin main
```

Netlify will auto-deploy when you push!

---

## 🔧 Build Settings in Netlify Dashboard

Go to: **Site configuration** → **Build & deploy** → **Build settings**

Set:
```
Base directory: (leave empty)
Build command: ./build.sh
Publish directory: build/web
```

---

## 🌐 Your Live URLs

After deployment:

**Netlify URL**:
```
https://darling-froyo-d375a6.netlify.app
```

**Custom Domain** (if you add one):
```
https://mayurbobade.com
```

---

## 🚀 Deploy Now

### Step 1: Push Configuration Files

```bash
git add netlify.toml build.sh NETLIFY_DEPLOY.md
git commit -m "Add Netlify configuration"
git push origin main
```

### Step 2: Configure in Netlify Dashboard

1. Go to: https://app.netlify.com/sites/darling-froyo-d375a6/configuration/deploys
2. Scroll to **Build settings**
3. Click **Edit settings**
4. Set:
   - Build command: `./build.sh`
   - Publish directory: `build/web`
5. Click **Save**

### Step 3: Trigger Deploy

1. Go to **Deploys** tab
2. Click **Trigger deploy** → **Deploy site**
3. Wait 3-5 minutes for build
4. Your portfolio will be live!

---

## 🔄 Auto-Deploy Setup

Netlify is already watching your GitHub repo. Every time you push to `main` branch, it will auto-deploy!

```bash
# Make changes
# Then:
git add .
git commit -m "Update portfolio"
git push origin main

# Netlify auto-deploys! 🎉
```

---

## 📊 Check Build Status

1. Go to: https://app.netlify.com/sites/darling-froyo-d375a6/deploys
2. See build logs
3. Check for errors

---

## 🎯 Quick Setup (Copy-Paste)

```bash
# Push config files
git add netlify.toml build.sh NETLIFY_DEPLOY.md
git commit -m "Add Netlify configuration"
git push origin main
```

Then in Netlify Dashboard:
1. Site configuration → Build & deploy → Edit settings
2. Build command: `./build.sh`
3. Publish directory: `build/web`
4. Save → Trigger deploy

---

## 🌐 Access Your Site

**Netlify Dashboard**:
https://app.netlify.com/sites/darling-froyo-d375a6

**Live Site** (after deploy):
https://darling-froyo-d375a6.netlify.app

---

## 💡 Custom Domain (Optional)

1. Go to **Domain management**
2. Click **Add custom domain**
3. Enter: `mayurbobade.com`
4. Follow DNS setup instructions
5. Wait for DNS propagation (24-48 hours)

---

## 🔧 Troubleshooting

### Build Fails?

Check build logs in Netlify dashboard. Common issues:

**Issue**: Flutter not found
**Fix**: Build script installs Flutter automatically

**Issue**: Dependencies fail
**Fix**: Check `pubspec.yaml` is correct

**Issue**: Build timeout
**Fix**: Upgrade Netlify plan or optimize build

---

## ✅ Deployment Checklist

- [x] GitHub connected to Netlify
- [x] netlify.toml created
- [x] build.sh created
- [ ] Push files to GitHub
- [ ] Configure build settings in Netlify
- [ ] Trigger deploy
- [ ] Test live site

---

## 🚀 Ready to Deploy!

Run these commands now:

```bash
git add netlify.toml build.sh NETLIFY_DEPLOY.md
git commit -m "Add Netlify configuration"
git push origin main
```

Then configure in Netlify dashboard and deploy! 🎉
