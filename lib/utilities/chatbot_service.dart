import '../core/constants/app_constants.dart';

class ChatbotService {
  static String getResponse(String userMessage) {
    final message = userMessage.toLowerCase().trim();

    // Greetings
    if (_containsAny(message, ['hi', 'hello', 'hey', 'namaste', 'hola', 'good morning', 'good evening'])) {
      return "Hello! I'm ${AppConstants.name}'s virtual assistant. How can I help you today?";
    }

    // About
    if (_containsAny(message, ['who are you', 'about', 'tell me about', 'introduce'])) {
      return "${AppConstants.name} is a Full Stack Developer with 2+ years of professional experience specializing in:\n\n- Python, AI/ML Development\n- Flutter & iOS Mobile Applications\n- Backend Systems (Django, FastAPI)\n- Government-scale Application Development\n\nCurrently working at MP State Electronics Development Corporation (MPSEDC) as a Flutter Developer, building large-scale government applications.";
    }

    // Experience
    if (_containsAny(message, ['experience', 'work history', 'job', 'career', 'employment'])) {
      return "Professional Experience:\n\nCurrent Position:\nFlutter Developer at MPSEDC (Feb 2024 - Present)\n- Developed MPeSeva and Sankat Ke Saathi government applications\n- Implemented Clean Architecture with Provider/GetX\n- Received Rising Star Award twice for exceptional performance\n- Integrated secure REST APIs and OAuth authentication\n\nPrevious Position:\nSoftware Engineer at 12th Wonder Research Organisation (2022-2023)\n- iOS development using Swift and UIKit\n- Enterprise projects including Titan Project and Wonder Health App\n- Integrated Apple HealthKit, Core Data, and Firebase";
    }

    // Skills
    if (_containsAny(message, ['skills', 'technology', 'tech stack', 'expertise', 'capabilities'])) {
      return "Technical Skills:\n\nProgramming Languages:\nPython, Dart, Swift, JavaScript, SQL, Objective-C\n\nMobile & Web Development:\nFlutter, iOS (UIKit), React.js, HTML/CSS, Clean Architecture\n\nBackend & AI:\nDjango, FastAPI, REST APIs, OCR, NLP, Machine Learning\n\nTools & Platforms:\nAWS, Docker, Git, Firebase, Postman, CI/CD\n\nSpecializations:\n- Cross-platform mobile development\n- AI/ML integration\n- Scalable backend systems\n- Government application development";
    }

    // Projects
    if (_containsAny(message, ['projects', 'portfolio', 'work samples', 'what have you built', 'showcase'])) {
      return "Key Projects:\n\n1. MPeSeva App\n   Government of Madhya Pradesh\n   - Scalable Flutter-based government services platform\n   - Role-based access control\n   - Real-time API communication\n   Technologies: Flutter, Provider, REST API, Clean Architecture\n\n2. AI-based OCR System\n   Document Intelligence Solution\n   - Transforms unstructured text to structured JSON\n   - Entity extraction using NLP and ML\n   Technologies: Python, Machine Learning, NLP, Tesseract\n\n3. Sankat Ke Saathi\n   Emergency Response System\n   - Real-time emergency response with location services\n   - Critical workflow data management\n   Technologies: Flutter, Google Maps, Real-time API\n\nPlease scroll down to view detailed project information in the Projects section.";
    }

    // Hire/Availability
    if (_containsAny(message, ['hire', 'available', 'freelance', 'work together', 'collaborate', 'opportunity'])) {
      return "Yes, I am currently open to new opportunities and collaborations.\n\nAvailable for:\n- Full-time positions\n- Contract work\n- Freelance projects\n- Consulting engagements\n\nTo discuss your project requirements:\nEmail: ${AppConstants.email}\nPhone: ${AppConstants.phone}\n\nI typically respond within 24 hours. You can also request a callback using the form below.";
    }

    // Contact
    if (_containsAny(message, ['contact', 'email', 'phone', 'reach', 'get in touch', 'connect'])) {
      return "Contact Information:\n\nEmail: ${AppConstants.email}\nPhone: ${AppConstants.phone}\nLinkedIn: ${AppConstants.linkedInUrl}\nGitHub: ${AppConstants.gitHubUrl}\n\nResponse Time: Within 24 hours\nAvailability: Monday - Friday, 9 AM - 6 PM IST\n\nYou can also request a callback by clicking the 'Request Callback' button below.";
    }

    // Resume/CV
    if (_containsAny(message, ['resume', 'cv', 'curriculum vitae', 'download resume'])) {
      return "You can download my complete resume here:\n${AppConstants.cvUrl}\n\nThe resume includes:\n- Detailed work experience\n- Complete technical skills\n- Project descriptions\n- Educational background\n- Certifications and awards\n\nFor any questions about my background, feel free to ask.";
    }

    // Education
    if (_containsAny(message, ['education', 'degree', 'study', 'college', 'university', 'qualification'])) {
      return "Educational Background:\n\nStrong technical foundation in Computer Science and Software Engineering with focus on:\n- Software Development\n- Data Structures & Algorithms\n- Database Management\n- System Design\n\nContinuous Learning:\n- Regular participation in technical workshops\n- Online certifications in emerging technologies\n- Active contribution to open-source projects";
    }

    // Location
    if (_containsAny(message, ['location', 'where', 'based', 'city', 'remote'])) {
      return "Location: Based in India\n\nWork Arrangements:\n- Open to remote work opportunities\n- Available for on-site work (location dependent)\n- Flexible with different time zones\n- Experience working with international teams\n\nPreferred work mode: Hybrid or Remote";
    }

    // Rates/Pricing
    if (_containsAny(message, ['rate', 'price', 'cost', 'budget', 'how much', 'pricing', 'charges'])) {
      return "Project Pricing:\n\nRates are determined based on:\n- Project scope and complexity\n- Timeline requirements\n- Technology stack\n- Ongoing support needs\n\nFor a detailed quote tailored to your specific requirements, please contact:\nEmail: ${AppConstants.email}\n\nI provide transparent pricing with no hidden costs and flexible payment terms.";
    }

    // Timeline
    if (_containsAny(message, ['timeline', 'how long', 'duration', 'when can you start', 'availability'])) {
      return "Project Timeline:\n\nStart Date: Typically within 1-2 weeks from agreement\n\nProject Duration: Depends on scope\n- Small projects: 2-4 weeks\n- Medium projects: 1-3 months\n- Large projects: 3-6 months\n\nI provide:\n- Detailed project timeline before starting\n- Regular progress updates\n- Milestone-based delivery\n- Agile development approach\n\nContact me to discuss your specific timeline requirements.";
    }

    // Flutter specific
    if (_containsAny(message, ['flutter', 'mobile app', 'android', 'ios app', 'cross-platform'])) {
      return "Flutter Development Expertise:\n\nExperience:\n- 2+ years of professional Flutter development\n- Built government-scale applications (MPeSeva, Sankat Ke Saathi)\n- Cross-platform apps for Android and iOS\n\nCapabilities:\n- Clean Architecture implementation\n- State management (Provider, GetX, Bloc)\n- REST API integration\n- Firebase integration\n- Custom UI/UX implementation\n- Performance optimization\n- App store deployment\n\nI can help you build high-quality, performant mobile applications for both platforms.";
    }

    // AI/ML specific
    if (_containsAny(message, ['ai', 'machine learning', 'ml', 'artificial intelligence', 'ocr', 'nlp'])) {
      return "AI/ML Expertise:\n\nSpecializations:\n- Optical Character Recognition (OCR)\n- Natural Language Processing (NLP)\n- Machine Learning model development\n- Intelligent automation pipelines\n\nTechnologies:\n- Python (TensorFlow, PyTorch, Scikit-learn)\n- Tesseract OCR\n- Custom ML model training\n- Data preprocessing and analysis\n\nProjects:\n- Built AI-based OCR system for document intelligence\n- Developed NLP pipelines for entity extraction\n- Created intelligent automation solutions\n\nI can help integrate AI/ML capabilities into your applications.";
    }

    // Backend
    if (_containsAny(message, ['backend', 'api', 'server', 'database', 'rest api'])) {
      return "Backend Development Expertise:\n\nFrameworks:\n- Django (Python)\n- FastAPI (Python)\n- REST API design and implementation\n\nCapabilities:\n- Scalable server architecture\n- Database design and optimization\n- Secure authentication (OAuth, JWT)\n- API documentation\n- Performance optimization\n- Cloud deployment (AWS)\n\nExperience:\n- Built backend systems for government applications\n- Integrated secure REST APIs\n- Optimized database queries for performance\n- Implemented microservices architecture\n\nI can develop robust, scalable backend solutions for your applications.";
    }

    // Awards
    if (_containsAny(message, ['award', 'achievement', 'recognition', 'accomplishment'])) {
      return "Awards & Recognition:\n\nRising Star Award (2x)\nMP State Electronics Development Corporation (MPSEDC)\n- Recognized for exceptional performance\n- Outstanding contribution to government projects\n- Excellence in technical implementation\n\nKey Achievements:\n- Successfully delivered multiple government-scale applications\n- Implemented Clean Architecture in production systems\n- Optimized application performance significantly\n- Mentored junior developers\n\nCommitted to delivering high-quality work that creates meaningful impact.";
    }

    // Callback request
    if (_containsAny(message, ['callback', 'call back', 'call me', 'schedule call', 'meeting'])) {
      return "Callback Request:\n\nTo schedule a callback, please use the 'Request Callback' button below and provide:\n- Your name\n- Contact number\n- Preferred date and time\n- Brief description of your requirements\n\nI will contact you at your preferred time to discuss your project in detail.\n\nAlternatively, you can directly reach me at:\nPhone: ${AppConstants.phone}\nEmail: ${AppConstants.email}";
    }

    // Document upload
    if (_containsAny(message, ['upload', 'document', 'file', 'attachment', 'send file'])) {
      return "Document Sharing:\n\nTo share project documents, requirements, or specifications:\n\n1. Email Method (Recommended):\n   Send documents to: ${AppConstants.email}\n   Supported formats: PDF, DOC, DOCX, XLS, XLSX, ZIP\n\n2. Cloud Storage:\n   Share Google Drive or Dropbox links via email\n\n3. GitHub:\n   For code repositories: ${AppConstants.gitHubUrl}\n\nPlease include:\n- Project description\n- Technical requirements\n- Timeline expectations\n- Budget range (if applicable)\n\nI will review and respond within 24 hours.";
    }

    // Thanks
    if (_containsAny(message, ['thank', 'thanks', 'appreciate'])) {
      return "You're welcome! If you have any other questions or would like to discuss a project, feel free to ask or contact me directly at ${AppConstants.email}";
    }

    // Goodbye
    if (_containsAny(message, ['bye', 'goodbye', 'see you', 'later'])) {
      return "Thank you for your interest. Feel free to return anytime if you have questions. For project inquiries, contact me at ${AppConstants.email}";
    }

    // Default response
    return "I can provide information about:\n\n- Professional experience and background\n- Technical skills and expertise\n- Project portfolio and work samples\n- Availability for new projects\n- Contact information\n- Resume download\n\nPlease ask a specific question, or contact directly at ${AppConstants.email} for detailed discussions.";
  }

  static bool _containsAny(String text, List<String> keywords) {
    return keywords.any((keyword) => text.contains(keyword));
  }

  static List<String> getQuickReplies() {
    return [
      "Tell me about your experience",
      "What are your technical skills?",
      "Show me your projects",
      "Are you available for hire?",
      "Request a callback",
    ];
  }
}
