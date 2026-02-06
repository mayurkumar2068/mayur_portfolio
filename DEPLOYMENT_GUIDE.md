# 🚀 Deployment Guide - GitHub Pages (Free)

## Quick Setup (5 Minutes)

Your portfolio will be live at: `https://yourusername.github.io/mayur_portfolio/`

### Step 1: Create GitHub Repository

1. Go to [GitHub](https://github.com)
2. Click "New Repository"
3. Name it: `mayur_portfolio`
4. Make it **Public**
5. Click "Create repository"

### Step 2: Push Your Code

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - Portfolio ready"

# Add remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/mayur_portfolio.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 3: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** tab
3. Click **Pages** in left sidebar
4. Under "Source", select:
   - Branch: `gh-pages`
   - Folder: `/ (root)`
5. Click **Save**

### Step 4: Wait for Deployment

- GitHub Actions will automatically build and deploy
- Check **Actions** tab to see progress
- Takes 2-3 minutes
- Your site will be live at: `https://YOUR_USERNAME.github.io/mayur_portfolio/`

## ✅ That's It!

Your portfolio is now:
- ✅ Live on the internet
- ✅ Free hosting forever
- ✅ Auto-deploys on every push
- ✅ Fast and reliable

## 🔄 How CI/CD Works

Every time you push code to GitHub:
1. GitHub Actions triggers automatically
2. Builds your Flutter web app
3. Deploys to GitHub Pages
4. Your site updates in 2-3 minutes

## 📝 Update Your Portfolio

```bash
# Make changes to your code
# Then:
git add .
git commit -m "Updated projects"
git push

# Wait 2-3 minutes - your site will update automatically!
```

## 🌐 Custom Domain (Optional)

Want `mayurbobade.com` instead of GitHub URL?

1. Buy domain from Namecheap/GoDaddy (~$10/year)
2. Add CNAME file with your domain
3. Update DNS settings
4. Done!

## 🎯 Alternative Free Hosting Options

### Option 1: Netlify (Recommended)
```bash
# Build
flutter build web

# Drag build/web folder to netlify.com
# Or connect GitHub for auto-deploy
```
**URL**: `https://mayurbobade.netlify.app`

### Option 2: Vercel
```bash
# Install Vercel CLI
npm install -g vercel

# Build and deploy
flutter build web
cd build/web
vercel
```
**URL**: `https://mayurbobade.vercel.app`

### Option 3: Firebase Hosting
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Initialize
firebase init hosting

# Build and deploy
flutter build web
firebase deploy
```
**URL**: `https://mayurbobade.web.app`

## 🔧 Troubleshooting

### Build Fails?
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter build web --release
```

### GitHub Actions Failing?
- Check Actions tab for error logs
- Ensure repository is public
- Verify Flutter version in workflow file

### Site Not Loading?
- Wait 5 minutes after first deploy
- Check if gh-pages branch exists
- Verify Pages settings in repository

### Images Not Showing?
- Check `pubspec.yaml` has assets configured
- Ensure images are in `assets/images/`
- Run `flutter pub get` after adding assets

## 📊 Monitoring

- **GitHub Actions**: See build status
- **GitHub Pages**: Check deployment status
- **Analytics**: Add Google Analytics (optional)

## 🎨 Update Base URL

If you change repository name, update `.github/workflows/deploy.yml`:

```yaml
run: flutter build web --release --base-href "/NEW_REPO_NAME/"
```

## 💡 Pro Tips

1. **Custom Domain**: Makes it more professional
2. **SSL**: GitHub Pages provides free HTTPS
3. **CDN**: GitHub Pages uses CDN for fast loading
4. **Analytics**: Track visitors with Google Analytics
5. **SEO**: Update meta tags in `web/index.html`

## 🚀 Your Portfolio URLs

After deployment, share these:

- **GitHub Pages**: `https://YOUR_USERNAME.github.io/mayur_portfolio/`
- **LinkedIn**: Add to your profile
- **Resume**: Include the link
- **Email Signature**: Add portfolio link

## 📱 Mobile Friendly

Your portfolio is already:
- ✅ Responsive
- ✅ Mobile optimized
- ✅ Fast loading
- ✅ PWA ready

## 🎯 Next Steps

1. Push code to GitHub
2. Enable GitHub Pages
3. Wait 3 minutes
4. Share your portfolio link!

---

**Need Help?**
- Check GitHub Actions logs
- Verify repository settings
- Ensure code is pushed to main branch

**Your portfolio will be live in minutes!** 🎉
