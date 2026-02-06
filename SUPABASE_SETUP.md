# 🎯 Supabase Deployment - Complete Setup

## Current Status
✅ You've already uploaded files to Supabase Storage
📍 URL: `https://bsnvsraqmdzidfihgwvn.storage.supabase.co`

Now let's make it **publicly accessible** and setup **auto-deployment**.

---

## 🚀 Quick Setup (5 Minutes)

### Step 1: Make Bucket Public

1. Go to [Supabase Dashboard](https://app.supabase.com)
2. Login to your project
3. Click **Storage** in left sidebar
4. Find your bucket (check what name you used)
5. Click the **3 dots** next to bucket name
6. Click **"Make Public"**
7. Confirm

### Step 2: Get Your Service Role Key

1. In Supabase Dashboard
2. Go to **Settings** (gear icon)
3. Click **API**
4. Copy **service_role** key (NOT anon key)
5. Keep it safe - you'll need it

### Step 3: Update Deploy Script

Open `deploy-supabase.js` and update:

```javascript
const SUPABASE_URL = 'https://bsnvsraqmdzidfihgwvn.supabase.co';
const SUPABASE_KEY = 'YOUR_SERVICE_ROLE_KEY_HERE'; // Paste your key
const BUCKET_NAME = 'portfolio'; // Your bucket name
```

### Step 4: Deploy

```bash
# Build and deploy
flutter build web --release
node deploy-supabase.js
```

### Step 5: Access Your Portfolio

Your portfolio will be live at:
```
https://bsnvsraqmdzidfihgwvn.supabase.co/storage/v1/object/public/BUCKET_NAME/index.html
```

---

## 🔄 Setup CI/CD (Auto-Deploy on Push)

### Step 1: Add GitHub Secrets

1. Go to your GitHub repository
2. **Settings** → **Secrets and variables** → **Actions**
3. Click **"New repository secret"**

Add these 3 secrets:

**SUPABASE_URL**
```
https://bsnvsraqmdzidfihgwvn.supabase.co
```

**SUPABASE_KEY**
```
your-service-role-key-here
```

**SUPABASE_BUCKET**
```
portfolio
```

### Step 2: Push to GitHub

```bash
git add .
git commit -m "Setup Supabase deployment"
git push origin main
```

### Step 3: Check Deployment

1. Go to **Actions** tab in GitHub
2. See workflow running
3. Wait 2-3 minutes
4. Green checkmark = Success!

---

## 📋 Manual Deployment Commands

### Option 1: Using Node.js (Recommended)

```bash
# One-time setup
npm install

# Deploy
npm run build-deploy
```

### Option 2: Using Bash Script

```bash
# Make executable
chmod +x upload-supabase.sh

# Update script with your keys
nano upload-supabase.sh

# Deploy
./upload-supabase.sh
```

### Option 3: Direct Flutter Build

```bash
# Build
flutter build web --release

# Then manually upload build/web folder to Supabase Dashboard
```

---

## 🌐 Your Portfolio URLs

After making bucket public:

**Main URL**:
```
https://bsnvsraqmdzidfihgwvn.supabase.co/storage/v1/object/public/portfolio/index.html
```

**Shorter URL** (if you setup custom domain):
```
https://mayurbobade.com
```

---

## 🎨 Custom Domain Setup (Optional)

1. Buy domain from Namecheap/GoDaddy
2. Add CNAME record:
   ```
   Type: CNAME
   Name: @
   Value: bsnvsraqmdzidfihgwvn.supabase.co
   ```
3. Wait 24 hours for DNS propagation
4. Access at your custom domain

---

## 🔧 Troubleshooting

### Issue: Files not accessible (403 Error)
**Solution**: Make bucket public in Supabase Dashboard

### Issue: Upload fails
**Solution**: 
- Check Service Role Key is correct
- Verify bucket name matches
- Ensure bucket exists

### Issue: Some files missing
**Solution**:
- Check `build/web` folder has all files
- Re-run `flutter build web --release`
- Upload again

### Issue: Styles not loading
**Solution**:
- Check CORS settings in Supabase
- Verify content-type headers
- Clear browser cache

---

## ✅ Deployment Checklist

- [ ] Bucket is public
- [ ] Service Role Key obtained
- [ ] Deploy script updated with keys
- [ ] Build successful (`flutter build web --release`)
- [ ] Files uploaded to Supabase
- [ ] Portfolio accessible at public URL
- [ ] All images loading
- [ ] Chatbot working
- [ ] Links working

---

## 🚀 Quick Deploy Command

```bash
# All in one:
flutter build web --release && node deploy-supabase.js
```

Or use npm script:
```bash
npm run build-deploy
```

---

## 📱 Share Your Portfolio

After deployment, share at:
- LinkedIn profile
- Resume
- Email signature
- GitHub profile
- Twitter/X bio

**Your URL**:
```
https://bsnvsraqmdzidfihgwvn.supabase.co/storage/v1/object/public/portfolio/index.html
```

---

## 💡 Pro Tips

1. **Versioning**: Upload to different folders for versions
   - `/v1/`, `/v2/`, etc.

2. **CDN**: Supabase uses CDN automatically

3. **Caching**: Files cached for fast loading

4. **SSL**: Automatic HTTPS

5. **Monitoring**: Check Supabase Dashboard for usage

---

**Ready to deploy? Follow Step 1 first - Make bucket public!** 🎉
