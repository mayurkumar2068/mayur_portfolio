# 🚀 START HERE - Deploy Your Portfolio

## ⚡ Quick 5-Step Deployment

Follow these commands in your terminal:

### Step 1: Install Supabase CLI

```bash
brew install supabase/tap/supabase
```

### Step 2: Login to Supabase

```bash
supabase login
```

This will open your browser - login with your Supabase account.

### Step 3: Link Your Project

```bash
supabase link --project-ref bsnvsraqmdzidfihgwvn
```

### Step 4: Build Flutter Web

```bash
flutter build web --release
```

### Step 5: Deploy

```bash
supabase hosting deploy build/web
```

---

## ✅ Done!

Your portfolio will be live at:
```
https://bsnvsraqmdzidfihgwvn.supabase.co
```

---

## 🔄 Future Updates

Whenever you make changes:

```bash
flutter build web --release
supabase hosting deploy build/web
```

Or use the script:

```bash
chmod +x deploy-supabase-hosting.sh
./deploy-supabase-hosting.sh
```

---

## 💡 Alternative: Use Script

The script will auto-install CLI if needed:

```bash
chmod +x deploy-supabase-hosting.sh
./deploy-supabase-hosting.sh
```

---

## 🎯 What's Next?

After deployment:
1. ✅ Test your portfolio URL
2. 📱 Share on LinkedIn
3. 📄 Add to resume
4. 🔗 Update GitHub profile

---

**Ready? Run Step 1 now!** 🚀
