# 🚀 Supabase Storage Deployment Guide

## Your Current Setup

You've already uploaded to Supabase Storage at:
```
https://bsnvsraqmdzidfihgwvn.storage.supabase.co/storage/v1/s3
```

Now let's make it **publicly accessible** and set up **CI/CD**.

---

## Step 1: Make Bucket Public

### Option A: Via Supabase Dashboard (Recommended)

1. Go to [Supabase Dashboard](https://app.supabase.com)
2. Select your project
3. Go to **Storage** in left sidebar
4. Find your bucket (probably named `portfolio` or `web`)
5. Click on bucket settings (3 dots)
6. Click **"Make Public"**
7. Confirm

### Option B: Via SQL

Run this in SQL Editor:
```sql
-- Make bucket public
UPDATE storage.buckets 
SET public = true 
WHERE name = 'YOUR_BUCKET_NAME';

-- Set public policy
CREATE POLICY "Public Access"
ON storage.objects FOR SELECT
USING ( bucket_id = 'YOUR_BUCKET_NAME' );
```

---

## Step 2: Get Your Public URL

After making bucket public, your portfolio will be accessible at:

```
https://bsnvsraqmdzidfihgwvn.supabase.co/storage/v1/object/public/BUCKET_NAME/index.html
```

Replace `BUCKET_NAME` with your actual bucket name.

---

## Step 3: Setup GitHub Secrets for CI/CD

1. Go to your GitHub repository
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **"New repository secret"**
4. Add these secrets:

**Secret 1: SUPABASE_URL**
```
Value: https://bsnvsraqmdzidfihgwvn.supabase.co
```

**Secret 2: SUPABASE_KEY**
```
Value: Your Supabase Service Role Key
(Get from: Supabase Dashboard → Settings → API → service_role key)
```

**Secret 3: SUPABASE_BUCKET**
```
Value: Your bucket name (e.g., portfolio or web)
```

---

## Step 4: Enable GitHub Actions

1. Push your code to GitHub (if not already done)
2. GitHub Actions will automatically trigger
3. Check **Actions** tab for deployment status
4. Wait 2-3 minutes

---

## Step 5: Access Your Portfolio

Your portfolio will be live at:
```
https://bsnvsraqmdzidfihgwvn.supabase.co/storage/v1/object/public/BUCKET_NAME/index.html
```

---

## 🎯 Alternative: Use Supabase Edge Functions (Better URL)

For a cleaner URL without `/index.html`, create an Edge Function:

### Create Edge Function

1. In Supabase Dashboard → **Edge Functions**
2. Create new function: `portfolio`
3. Add this code:

```typescript
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"

serve(async (req) => {
  const url = new URL(req.url)
  const path = url.pathname === '/' ? '/index.html' : url.pathname
  
  const storageUrl = `https://bsnvsraqmdzidfihgwvn.supabase.co/storage/v1/object/public/BUCKET_NAME${path}`
  
  const response = await fetch(storageUrl)
  const content = await response.text()
  
  return new Response(content, {
    headers: {
      'Content-Type': response.headers.get('Content-Type') || 'text/html',
    },
  })
})
```

4. Deploy function
5. Your portfolio will be at:
```
https://bsnvsraqmdzidfihgwvn.supabase.co/functions/v1/portfolio
```

---

## 🔄 Manual Upload Script

If you want to manually upload without CI/CD:

```bash
#!/bin/bash

# Configuration
SUPABASE_URL="https://bsnvsraqmdzidfihgwvn.supabase.co"
SUPABASE_KEY="your-service-role-key"
BUCKET_NAME="your-bucket-name"

# Build
flutter build web --release

# Upload
cd build/web
for file in $(find . -type f); do
  echo "Uploading $file..."
  curl -X POST \
    "${SUPABASE_URL}/storage/v1/object/${BUCKET_NAME}/${file#./}" \
    -H "Authorization: Bearer ${SUPABASE_KEY}" \
    -H "Content-Type: application/octet-stream" \
    --data-binary "@$file"
done

echo "✅ Upload complete!"
echo "🌐 Visit: ${SUPABASE_URL}/storage/v1/object/public/${BUCKET_NAME}/index.html"
```

Save as `upload-supabase.sh` and run:
```bash
chmod +x upload-supabase.sh
./upload-supabase.sh
```

---

## 📋 Quick Setup Checklist

- [ ] Make Supabase bucket public
- [ ] Get Supabase URL and Service Role Key
- [ ] Add GitHub Secrets (SUPABASE_URL, SUPABASE_KEY, SUPABASE_BUCKET)
- [ ] Push code to GitHub
- [ ] Check GitHub Actions for deployment
- [ ] Access portfolio at public URL

---

## 🎯 Your Portfolio URLs

After setup:

**Direct Storage URL**:
```
https://bsnvsraqmdzidfihgwvn.supabase.co/storage/v1/object/public/BUCKET_NAME/index.html
```

**With Edge Function** (cleaner):
```
https://bsnvsraqmdzidfihgwvn.supabase.co/functions/v1/portfolio
```

---

## 💡 Pro Tips

1. **Custom Domain**: Add CNAME record pointing to Supabase URL
2. **CDN**: Supabase uses CDN for fast loading
3. **SSL**: Automatic HTTPS
4. **Versioning**: Keep old versions in different folders

---

## 🔧 Troubleshooting

### Files not accessible?
- Check bucket is public
- Verify file paths are correct
- Check CORS settings in Supabase

### Upload fails?
- Verify Service Role Key
- Check bucket name is correct
- Ensure bucket exists

### 404 Error?
- Check file path includes `/index.html`
- Verify files uploaded successfully
- Check bucket permissions

---

## 🚀 Next Steps

1. Make bucket public in Supabase Dashboard
2. Get your Service Role Key
3. Add GitHub Secrets
4. Push code to trigger deployment
5. Share your portfolio URL!

---

**Your portfolio will be live in minutes!** 🎉
