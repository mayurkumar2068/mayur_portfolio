# Portfolio Setup Guide

## 🎯 Quick Start

Follow these steps to personalize your portfolio:

### Step 1: Update Personal Information

Edit `lib/core/constants/app_constants.dart`:

```dart
class AppConstants {
  // Update these with your information
  static const String name = "Your Name";
  static const String email = "your.email@example.com";
  static const String phone = "+91 XXXXXXXXXX";
  
  // Update your social links
  static const String linkedInUrl = "https://www.linkedin.com/in/your-profile";
  static const String gitHubUrl = "https://github.com/your-username";
  static const String cvUrl = "https://your-resume-link.com";
}
```

### Step 2: Add Your Profile Picture

1. Save your profile image as `profile.jpg` or `profile.png`
2. Place it in the `assets/images/` folder
3. The image you provided has been saved - you can use it!

### Step 3: Update Your Experience

Edit `lib/utilities/data_provider.dart` in the `getExperiences()` method:

```dart
Experience(
  role: "Your Job Title",
  company: "Company Name",
  duration: "Start Date - End Date",
  responsibilities: [
    "Achievement or responsibility 1",
    "Achievement or responsibility 2",
    "Achievement or responsibility 3",
  ],
),
```

### Step 4: Update Your Skills

Edit the `getSkills()` method in `lib/utilities/data_provider.dart`:

```dart
SkillCategory(
  category: "Category Name",
  skills: ["Skill 1", "Skill 2", "Skill 3"],
),
```

### Step 5: Add Your Projects

Edit the `getProjects()` method in `lib/utilities/data_provider.dart`:

```dart
Project(
  title: "Project Name",
  subtitle: "Project Type/Client",
  description: "Brief description of the project and your role",
  technologies: ["Tech 1", "Tech 2", "Tech 3"],
  link: "https://project-link.com", // Optional
),
```

### Step 6: Customize Colors (Optional)

Edit `lib/core/constants/app_constants.dart`:

```dart
// Current theme: Cyber Dark
static const int primaryColorValue = 0xFF64FFDA;  // Cyber Green
static const int backgroundColorValue = 0xFF0A192F; // Deep Navy
static const int cardColorValue = 0xFF112240;      // Light Navy

// Alternative themes you can try:
// Purple Theme:
// primaryColorValue = 0xFF9D4EDD
// backgroundColorValue = 0xFF10002B
// cardColorValue = 0xFF240046

// Blue Theme:
// primaryColorValue = 0xFF00B4D8
// backgroundColorValue = 0xFF03045E
// cardColorValue = 0xFF0077B6
```

## 🚀 Running Your Portfolio

### Development Mode
```bash
flutter run -d chrome
```

### Build for Production
```bash
flutter build web --release
```

## 📤 Deployment Options

### Option 1: GitHub Pages

1. Build the project:
```bash
flutter build web --base-href "/repository-name/"
```

2. Push the `build/web` contents to the `gh-pages` branch

3. Enable GitHub Pages in repository settings

### Option 2: Firebase Hosting

1. Install Firebase CLI:
```bash
npm install -g firebase-tools
```

2. Initialize Firebase:
```bash
firebase init hosting
```

3. Build and deploy:
```bash
flutter build web
firebase deploy
```

### Option 3: Netlify

1. Build the project:
```bash
flutter build web
```

2. Drag and drop the `build/web` folder to Netlify

Or connect your GitHub repository for automatic deployments.

### Option 4: Vercel

1. Install Vercel CLI:
```bash
npm install -g vercel
```

2. Build and deploy:
```bash
flutter build web
cd build/web
vercel
```

## 🎨 Advanced Customization

### Adding New Sections

1. Create a new widget in `lib/viewcomponents/`
2. Add the section to `lib/main.dart` in the `build` method
3. Update navigation in `_buildNavbar()` and `_buildMobileDrawer()`

### Changing Fonts

Edit `lib/core/theme/app_theme.dart`:

```dart
textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme)
// Try: poppins, montserrat, openSans, lato, etc.
```

### Adding Animations

Import animate_do and wrap widgets:

```dart
FadeInUp(
  delay: Duration(milliseconds: 200),
  child: YourWidget(),
)
```

Available animations: FadeIn, FadeInUp, FadeInDown, SlideInLeft, BounceIn, etc.

## 🐛 Troubleshooting

### Issue: Images not showing
- Ensure images are in `assets/images/`
- Run `flutter pub get` after updating pubspec.yaml
- Restart the app

### Issue: Links not opening
- Check URL format in `app_constants.dart`
- Ensure URLs start with `https://` or `mailto:`

### Issue: Build errors
```bash
flutter clean
flutter pub get
flutter build web
```

## 📱 Testing Responsiveness

Test on different screen sizes:
```bash
# Desktop
flutter run -d chrome

# Mobile view (Chrome DevTools)
# Press F12 > Toggle device toolbar > Select mobile device
```

## ✅ Pre-Deployment Checklist

- [ ] Updated all personal information
- [ ] Added profile picture
- [ ] Updated experience section
- [ ] Updated skills section
- [ ] Added projects with correct links
- [ ] Updated social media links
- [ ] Uploaded resume and updated CV link
- [ ] Tested on mobile and desktop
- [ ] Verified all links work
- [ ] Ran `flutter analyze` (no errors)
- [ ] Built successfully with `flutter build web`

## 🎓 Learning Resources

- [Flutter Web Documentation](https://flutter.dev/web)
- [Google Fonts Package](https://pub.dev/packages/google_fonts)
- [Animate Do Package](https://pub.dev/packages/animate_do)
- [URL Launcher Package](https://pub.dev/packages/url_launcher)

## 💡 Tips for a Great Portfolio

1. **Keep it updated**: Regularly add new projects and skills
2. **Quality over quantity**: Showcase your best 3-5 projects
3. **Be specific**: Use metrics and achievements in experience
4. **Test thoroughly**: Check on different devices and browsers
5. **Optimize images**: Compress images for faster loading
6. **SEO friendly**: Update meta tags in `web/index.html`

## 🤝 Need Help?

If you encounter any issues:
1. Check the error message carefully
2. Run `flutter doctor` to verify setup
3. Search for the error on Stack Overflow
4. Check Flutter documentation

---

Good luck with your portfolio! 🚀
