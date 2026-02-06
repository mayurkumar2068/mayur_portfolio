# 🚀 Deployment Checklist

## Before Deployment

- [ ] Update personal info in `lib/core/constants/app_constants.dart`
- [ ] Add your profile photo to `assets/images/mayur.png`
- [ ] Update experience in `lib/utilities/data_provider.dart`
- [ ] Update projects with correct links
- [ ] Update skills list
- [ ] Test locally: `flutter run -d chrome`
- [ ] Build successfully: `flutter build web --release`
- [ ] No errors: `flutter analyze`

## GitHub Setup

- [ ] Create GitHub account (if not exists)
- [ ] Create new repository: `mayur_portfolio`
- [ ] Make repository **Public**
- [ ] Copy repository URL

## Deploy Steps

### Step 1: Initialize Git
```bash
git init
git add .
git commit -m "Initial commit"
```

### Step 2: Connect to GitHub
```bash
# Replace YOUR_USERNAME with your GitHub username
git remote add origin https://github.com/YOUR_USERNAME/mayur_portfolio.git
git branch -M main
git push -u origin main
```

### Step 3: Enable GitHub Pages
1. Go to repository Settings
2. Click Pages (left sidebar)
3. Source: Select `gh-pages` branch
4. Click Save

### Step 4: Wait for Deployment
- Check Actions tab
- Wait 2-3 minutes
- Visit: `https://YOUR_USERNAME.github.io/mayur_portfolio/`

## Post-Deployment

- [ ] Test portfolio URL
- [ ] Check all links work
- [ ] Test on mobile
- [ ] Test chatbot
- [ ] Test callback form
- [ ] Share on LinkedIn
- [ ] Add to resume
- [ ] Add to email signature

## Update Portfolio

```bash
# Make changes
# Then:
git add .
git commit -m "Updated content"
git push

# Auto-deploys in 2-3 minutes!
```

## Troubleshooting

### Build Fails?
```bash
flutter clean
flutter pub get
flutter build web --release
```

### GitHub Actions Error?
- Check Actions tab for logs
- Verify repository is public
- Check Flutter version in workflow

### Site Not Loading?
- Wait 5 minutes
- Check gh-pages branch exists
- Verify Pages settings

## Success Indicators

✅ GitHub Actions shows green checkmark
✅ gh-pages branch created
✅ Portfolio loads at GitHub Pages URL
✅ All images display correctly
✅ All links work
✅ Chatbot responds
✅ Mobile responsive

## Your Portfolio URLs

After deployment:
- **Main**: `https://YOUR_USERNAME.github.io/mayur_portfolio/`
- **LinkedIn**: Add to profile
- **Resume**: Include link
- **Email**: Add to signature

---

**Ready to deploy? Follow the steps above!** 🎉
