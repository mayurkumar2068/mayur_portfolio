# 🚀 Quick Reference Card

## 📝 Update Your Info (3 Minutes)

### 1. Personal Details
**File**: `lib/core/constants/app_constants.dart`
```dart
static const String name = "Your Name";
static const String email = "your@email.com";
static const String linkedInUrl = "https://linkedin.com/in/yourprofile";
static const String gitHubUrl = "https://github.com/yourusername";
static const String cvUrl = "your-resume-url";
```

### 2. Experience
**File**: `lib/utilities/data_provider.dart` → `getExperiences()`
```dart
Experience(
  role: "Your Title",
  company: "Company Name",
  duration: "Start - End",
  responsibilities: ["Achievement 1", "Achievement 2"],
),
```

### 3. Skills
**File**: `lib/utilities/data_provider.dart` → `getSkills()`
```dart
SkillCategory(
  category: "Category",
  skills: ["Skill1", "Skill2"],
),
```

### 4. Projects
**File**: `lib/utilities/data_provider.dart` → `getProjects()`
```dart
Project(
  title: "Project Name",
  subtitle: "Type",
  description: "What you built",
  technologies: ["Tech1", "Tech2"],
  link: "https://project-url.com",
),
```

## 🎨 Change Colors

**File**: `lib/core/constants/app_constants.dart`
```dart
static const int primaryColorValue = 0xFF64FFDA;     // Accent
static const int backgroundColorValue = 0xFF0A192F;  // Background
static const int cardColorValue = 0xFF112240;        // Cards
```

## 🖼️ Add Profile Picture

1. Save image as `profile.jpg` or `profile.png`
2. Place in `assets/images/` folder
3. Image is already configured in `pubspec.yaml`

## ⚡ Common Commands

```bash
# Install dependencies
flutter pub get

# Run locally
flutter run -d chrome

# Check for errors
flutter analyze

# Build for production
flutter build web --release

# Clean build
flutter clean && flutter pub get
```

## 🌐 Deploy (Choose One)

### GitHub Pages
```bash
flutter build web --base-href "/repo-name/"
# Push build/web to gh-pages branch
```

### Netlify
```bash
flutter build web
# Drag build/web folder to netlify.com
```

### Firebase
```bash
flutter build web
firebase deploy
```

### Vercel
```bash
flutter build web
cd build/web
vercel
```

## 📁 File Structure

```
lib/
├── core/constants/app_constants.dart    ← Update personal info
├── core/theme/app_theme.dart            ← Change theme
├── utilities/data_provider.dart         ← Update content
├── models/                              ← Data structures
├── viewcomponents/                      ← UI components
└── main.dart                            ← Main app
```

## 🐛 Quick Fixes

### Build Error?
```bash
flutter clean
flutter pub get
flutter build web
```

### Links Not Working?
- Check URLs start with `https://` or `mailto:`
- Verify in `app_constants.dart`

### Images Not Showing?
- Check file is in `assets/images/`
- Run `flutter pub get`
- Restart app

## ✅ Pre-Deploy Checklist

- [ ] Updated name, email, phone
- [ ] Added LinkedIn, GitHub, resume links
- [ ] Updated experience section
- [ ] Updated skills
- [ ] Added projects with links
- [ ] Added profile picture
- [ ] Tested on mobile and desktop
- [ ] Ran `flutter analyze` (0 errors)
- [ ] Built successfully

## 🎯 Key Files to Edit

1. **app_constants.dart** - Personal info & links
2. **data_provider.dart** - Experience, skills, projects
3. **pubspec.yaml** - Dependencies (if needed)

## 💡 Pro Tips

- Use **metrics** in experience (e.g., "Improved performance by 40%")
- Keep **3-5 best projects** only
- **Update regularly** - shows you're active
- **Test on mobile** - most visitors use phones
- **Compress images** - faster loading
- **Add real links** - make it easy to contact you

## 🆘 Need Help?

1. Check `SETUP_GUIDE.md` for detailed instructions
2. Check `ARCHITECTURE.md` for technical details
3. Run `flutter doctor` to verify setup
4. Search error messages on Stack Overflow

## 🚀 Launch in 5 Steps

1. Update `app_constants.dart` with your info
2. Update `data_provider.dart` with your content
3. Add profile picture to `assets/images/`
4. Run `flutter build web --release`
5. Deploy `build/web` folder

---

**That's it!** Your portfolio is ready to impress! 🌟
