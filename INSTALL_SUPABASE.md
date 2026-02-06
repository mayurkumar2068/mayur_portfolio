# 🔧 Install Supabase CLI - macOS

## ✅ Correct Method: Use Homebrew

```bash
# Install Supabase CLI
brew install supabase/tap/supabase

# Verify installation
supabase --version
```

---

## 🚀 Complete Setup

### Step 1: Install CLI

```bash
brew install supabase/tap/supabase
```

### Step 2: Login

```bash
supabase login
```

### Step 3: Link Project

```bash
supabase link --project-ref bsnvsraqmdzidfihgwvn
```

### Step 4: Deploy

```bash
# Build
flutter build web --release

# Deploy
supabase hosting deploy build/web
```

---

## 🔄 Alternative: Use npx (No Installation)

If Homebrew doesn't work, use npx:

```bash
# No installation needed - use directly
npx supabase login
npx supabase link --project-ref bsnvsraqmdzidfihgwvn
npx supabase hosting deploy build/web
```

---

## ⚡ Quick Deploy Script (Updated)

```bash
#!/bin/bash

# Build
flutter build web --release

# Deploy using npx (no installation needed)
npx supabase hosting deploy build/web
```

---

## 💡 Recommended: Use Homebrew

Homebrew is the official way for macOS:

```bash
brew install supabase/tap/supabase
```

Then follow normal commands.

---

## 🎯 Your Choice

**Option 1: Homebrew** (Recommended)
```bash
brew install supabase/tap/supabase
supabase login
```

**Option 2: npx** (No installation)
```bash
npx supabase login
```

Choose one and proceed!
