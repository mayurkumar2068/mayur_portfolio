import '../models/experience_model.dart';
import '../models/project_model.dart';
import '../models/skill_category_model.dart';

class DataProvider {
  static List<Experience> getExperiences() {
    return [
      Experience(
        role: "Flutter Developer",
        company: "MP State Electronics Development Corporation Ltd. (MPSEDC), Bhopal",
        duration: "Feb 2024 - Present",
        responsibilities: [
          "Independently designed and developed government mobile applications MPeSeva and Sankat Ke Saathi for citizens of Madhya Pradesh using Flutter for Android and iOS platforms",
          "Owned the complete mobile application lifecycle including UI/UX design, application architecture, state management using Provider and GetX, and REST API integration",
          "Implemented secure authentication, data handling, and performance optimization to ensure scalability and reliability of citizen-facing applications",
          "Collaborated with government stakeholders and internal teams to understand requirements and deliver user-friendly, compliant solutions",
          "Received Rising Star Award twice for exceptional performance, single-handed ownership, timely delivery, and high-quality implementation of government service apps"
        ],
      ),
      Experience(
        role: "Software Engineer (iOS / Flutter)",
        company: "12th Wonder Research Organisation, Pune",
        duration: "2022 - 2023",
        responsibilities: [
          "Developed and maintained iOS applications with strong focus on UI/UX design and smooth navigation using Swift and UIKit",
          "Worked on enterprise projects including Titan Project and Wonder Health App, contributing to feature development and performance optimization",
          "Integrated Apple HealthKit, Core Data, and Core Animation to manage health data and enhance user experience",
          "Implemented third-party libraries using CocoaPods and followed best practices for version control using Git",
          "Collaborated with designers and backend teams to deliver stable, scalable, and client-ready mobile solutions"
        ],
      ),
    ];
  }

  static List<SkillCategory> getSkills() {
    return [
      SkillCategory(
        category: "Mobile Development",
        skills: ["Flutter", "Dart", "iOS Development", "Swift", "Objective-C", "Android", "UIKit"],
      ),
      SkillCategory(
        category: "UI/UX & Frameworks",
        skills: ["Material UI", "Cupertino", "Core Animation", "Auto Layout", "Responsive Design"],
      ),
      SkillCategory(
        category: "Data & Storage",
        skills: ["Core Data", "SQLite", "Shared Preferences", "JSON Parsing", "MySQL"],
      ),
      SkillCategory(
        category: "Backend & Integration",
        skills: ["REST APIs", "HTTP", "Secure Authentication", "Firebase", "API Integration"],
      ),
      SkillCategory(
        category: "Tools & Platforms",
        skills: ["Xcode", "Android Studio", "Git", "GitHub Actions", "CocoaPods", "CI/CD", "TestFlight"],
      ),
      SkillCategory(
        category: "AI Code Editors & Platform",
        skills: ["Chatgpt", "Kiro", "Cursor AI", "Gemini", "Deepseek","Github Copilot"],
      ),

       SkillCategory(
        category: "State Management & Architecture",
        skills: ["Provider", "GetX", "Clean Architecture", "MVVM"],
      ),

    ];
  }

  static List<Project> getProjects() {
    return [
      Project(
        title: "MPeSeva",
        subtitle: "Government of Madhya Pradesh - Citizen Services Platform",
        description:
            "Led end-to-end development of Flutter mobile application for government services. Independently designed and developed the complete application including UI/UX design, application architecture, state management using Provider and GetX, and REST API integration. Coordinated with backend teams for API integration, database connectivity, and secure data exchange. Implemented secure authentication, data handling, and performance optimization to ensure scalability and reliability. Collaborated with government stakeholders to deliver user-friendly, compliant solutions for citizens of Madhya Pradesh.",
        technologies: ["Flutter", "Dart", "Provider", "GetX", "REST API", "Secure Authentication", "Android", "iOS"],
        link: "https://play.google.com/store/apps/details?id=com.mpsedc.mpeseva",
      ),
      Project(
        title: "Sankat Ke Saathi",
        subtitle: "MapIT - Emergency Services Application",
        description:
            "Developed Flutter-based emergency response mobile application while leading discussions around backend APIs, data flow, and database requirements. Integrated real-time service APIs, emergency workflows, and tracking features by coordinating with backend and infrastructure teams. Worked closely with multiple stakeholders to ensure reliable API performance, secure data handling, and smooth end-to-end functionality during critical emergency scenarios. Implemented location services and real-time tracking for emergency response coordination.",
        technologies: ["Flutter", "Dart", "Google Maps", "Real-time API", "Location Services", "Emergency Workflows"],
        link: "https://play.google.com/store/apps/details?id=com.mpsedc.sankatKeSaathi",
      ),
      Project(
        title: "Wonder Health App",
        subtitle: "12th Wonder Research Organisation - Health Management",
        description:
            "Contributed to development of iOS health management application using Swift with strong focus on UI/UX and navigation. Collaborated with backend teams for API integration and secure data handling using Core Data. Enhanced application performance and user experience using Core Animation, Firebase, and third-party libraries. Integrated Apple HealthKit for health data management and implemented secure authentication and data synchronization features.",
        technologies: ["Swift", "UIKit", "Core Data", "Core Animation", "HealthKit", "Firebase", "iOS"],
      ),
      Project(
        title: "Titan Project",
        subtitle: "12th Wonder Research Organisation - Enterprise Solution",
        description:
            "Developed and maintained iOS enterprise application with strong focus on UI/UX design and smooth navigation using Swift and UIKit. Implemented third-party libraries using CocoaPods and followed best practices for version control using Git. Collaborated with designers and backend teams to deliver stable, scalable, and client-ready mobile solution. Focused on performance optimization and seamless user experience.",
        technologies: ["Swift", "Objective-C", "UIKit", "CocoaPods", "Git", "Auto Layout"],
      ),
    ];
  }
}
