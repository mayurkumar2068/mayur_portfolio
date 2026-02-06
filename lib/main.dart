import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'utilities/data_provider.dart';
import 'utilities/url_helper.dart';
import 'viewcomponents/experience_card.dart';
import 'viewcomponents/project_card.dart';
import 'viewcomponents/skill_category_card.dart';
import 'viewcomponents/chatbot_widget.dart';

void main() {
  runApp(const MayurPortfolioApp());
}

class MayurPortfolioApp extends StatelessWidget {
  const MayurPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutQuart,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Scaffold(
      appBar: isMobile
          ? AppBar(
              backgroundColor: const Color(AppConstants.backgroundColorValue),
              elevation: 0,
            )
          : null,
      drawer: isMobile ? _buildMobileDrawer() : null,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 100,
              vertical: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMobile) _buildNavbar(),
                const SizedBox(height: 50),
                _buildHeroSection(isMobile),
                const SizedBox(height: 150),
                _buildSectionTitle("01.", "Experience"),
                const SizedBox(height: 40),
                _buildExperienceSection(),
                const SizedBox(height: 150),
                _buildSectionTitle("02.", "Technical Skills"),
                const SizedBox(height: 40),
                _buildSkillsSection(),
                const SizedBox(height: 150),
                _buildSectionTitle("03.", "Featured Projects"),
                const SizedBox(height: 40),
                _buildProjectsSection(),
                const SizedBox(height: 150),
                _buildContactSection(),
                const SizedBox(height: 100),
                _buildFooter(),
              ],
            ),
          ),
          if (!isMobile)
            Positioned(
              left: 40,
              bottom: 0,
              child: _buildSocialSideBar(),
            ),
          // Chatbot Widget
          const ChatbotWidget(),
        ],
      ),
    );
  }

  Widget _buildNavbar() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF112240).withValues(alpha: 0.8),
              const Color(0xFF1A2F4F).withValues(alpha: 0.6),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFF64FFDA).withValues(alpha: 0.2),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF64FFDA), Color(0xFF00D9A5)],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF64FFDA).withValues(alpha: 0.4),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Text(
                "MB",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: const Color(0xFF0A192F),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Row(
              children: [
                _navBtn("01. Experience", () => _scrollToSection(900)),
                _navBtn("02. Skills", () => _scrollToSection(1800)),
                _navBtn("03. Projects", () => _scrollToSection(2600)),
                _navBtn("04. Contact", () => _scrollToSection(3500)),
                const SizedBox(width: 20),
                _buildGradientButton(
                  "Resume",
                  () => UrlHelper.launchURL(AppConstants.cvUrl),
                  isPrimary: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side - Text content
          Expanded(
            flex: isMobile ? 1 : 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF64FFDA).withValues(alpha: 0.2),
                          const Color(0xFF64FFDA).withValues(alpha: 0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      "Hi, my name is",
                      style: GoogleFonts.firaCode(
                        color: const Color(AppConstants.primaryColorValue),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                FadeInUp(
                  delay: const Duration(milliseconds: 400),
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFCCD6F6), Color(0xFF64FFDA)],
                    ).createShader(bounds),
                    child: Text(
                      "${AppConstants.name}.",
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 40 : 70,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                FadeInUp(
                  delay: const Duration(milliseconds: 600),
                  child: Text(
                    "I build intelligent mobile & web systems.",
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 50,
                      fontWeight: FontWeight.w700,
                      color: const Color(AppConstants.textColorValue),
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Text(
                      "Hybrid Python, AI/ML, and Mobile Application Developer with 2+ years of experience. I specialize in designing scalable government systems, building intelligent automation pipelines, and high-performance Android/iOS apps.",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        height: 1.8,
                        color: const Color(0xFF8892B0),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                FadeInUp(
                  delay: const Duration(milliseconds: 1000),
                  child: Row(
                    children: [
                      _buildGradientButton(
                        "Get In Touch",
                        () => UrlHelper.launchURL("mailto:${AppConstants.email}"),
                        isPrimary: true,
                      ),
                      const SizedBox(width: 20),
                      _buildGradientButton(
                        "View Resume",
                        () => UrlHelper.launchURL(AppConstants.cvUrl),
                        isPrimary: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Right side - Profile image with decorations
          if (!isMobile) ...[
            const SizedBox(width: 60),
            Expanded(
              flex: 2,
              child: FadeInRight(
                delay: const Duration(milliseconds: 600),
                child: _buildProfileSection(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildGradientButton(String text, VoidCallback onPressed, {required bool isPrimary}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          decoration: BoxDecoration(
            gradient: isPrimary
                ? const LinearGradient(
                    colors: [Color(0xFF64FFDA), Color(0xFF00D9A5)],
                  )
                : null,
            color: isPrimary ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: isPrimary
                ? null
                : Border.all(color: const Color(0xFF64FFDA), width: 2),
            boxShadow: isPrimary
                ? [
                    BoxShadow(
                      color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ]
                : null,
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isPrimary ? const Color(0xFF0A192F) : const Color(0xFF64FFDA),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Animated gradient background
        Container(
          width: 350,
          height: 350,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF64FFDA), Color(0xFF00D9A5), Color(0xFF0077B6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                blurRadius: 60,
                spreadRadius: 10,
              ),
            ],
          ),
        ),
        // Profile image placeholder
        Container(
          width: 320,
          height: 320,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF112240),
            border: Border.all(color: const Color(0xFF64FFDA), width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 30,
              ),
            ],
          ),
          child: ClipOval(
            child: Container(
              color: const Color(0xFF1A2F4F),
              child: const Icon(
                Icons.person,
                size: 150,
                color: Color(0xFF64FFDA),
              ),
            ),
          ),
        ),
        // Floating tech icons
        Positioned(
          top: 20,
          right: 20,
          child: _buildFloatingIcon(Icons.code, 0),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          child: _buildFloatingIcon(Icons.phone_android, 1),
        ),
        Positioned(
          top: 80,
          left: 0,
          child: _buildFloatingIcon(Icons.web, 2),
        ),
      ],
    );
  }

  Widget _buildFloatingIcon(IconData icon, int index) {
    return BounceInDown(
      delay: Duration(milliseconds: 1000 + (index * 200)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF64FFDA), Color(0xFF00D9A5)],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF64FFDA).withValues(alpha: 0.4),
              blurRadius: 15,
            ),
          ],
        ),
        child: Icon(icon, color: const Color(0xFF0A192F), size: 24),
      ),
    );
  }

  Widget _buildExperienceSection() {
    final experiences = DataProvider.getExperiences();
    return Column(
      children: experiences
          .map((exp) => Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ExperienceCard(experience: exp),
              ))
          .toList(),
    );
  }

  Widget _buildSkillsSection() {
    final skills = DataProvider.getSkills();
    return FadeInRight(
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: skills
            .map((skill) => SkillCategoryCard(skillCategory: skill))
            .toList(),
      ),
    );
  }

  Widget _buildProjectsSection() {
    final projects = DataProvider.getProjects();
    return Column(
      children: projects
          .map((project) => Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ProjectCard(project: project),
              ))
          .toList(),
    );
  }

  Widget _buildContactSection() {
    return Center(
      child: FadeInUp(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          padding: const EdgeInsets.all(60),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF112240).withValues(alpha: 0.8),
                const Color(0xFF1A2F4F).withValues(alpha: 0.6),
              ],
            ),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF64FFDA).withValues(alpha: 0.2),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF64FFDA).withValues(alpha: 0.2),
                      const Color(0xFF00D9A5).withValues(alpha: 0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "04. What's Next?",
                  style: GoogleFonts.firaCode(
                    color: const Color(0xFF64FFDA),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFFCCD6F6), Color(0xFF64FFDA)],
                ).createShader(bounds),
                child: Text(
                  "Get In Touch",
                  style: GoogleFonts.poppins(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                "I am currently looking for new opportunities. Whether you have a question or just want to say hi, my inbox is always open!",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  height: 1.8,
                  color: const Color(0xFF8892B0),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGradientButton(
                    "Send Message",
                    () => UrlHelper.launchURL("mailto:${AppConstants.email}"),
                    isPrimary: true,
                  ),
                  const SizedBox(width: 20),
                  _buildSocialButton(
                    Icons.phone,
                    "Call Now",
                    () => UrlHelper.launchURL("tel:${AppConstants.phone}"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label, VoidCallback onPressed) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
          decoration: BoxDecoration(
            color: const Color(0xFF112240),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: const Color(0xFF64FFDA), size: 20),
              const SizedBox(width: 10),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF64FFDA),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            const Color(0xFF112240).withValues(alpha: 0.3),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIconButton(
                FontAwesomeIcons.github,
                AppConstants.gitHubUrl,
                "GitHub",
              ),
              const SizedBox(width: 25),
              _buildSocialIconButton(
                FontAwesomeIcons.linkedin,
                AppConstants.linkedInUrl,
                "LinkedIn",
              ),
              const SizedBox(width: 25),
              _buildSocialIconButton(
                FontAwesomeIcons.envelope,
                "mailto:${AppConstants.email}",
                "Email",
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF112240).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.favorite, color: Color(0xFF64FFDA), size: 16),
                const SizedBox(width: 10),
                Text(
                  "Designed & Built by ${AppConstants.name}",
                  style: GoogleFonts.firaCode(
                    fontSize: 13,
                    color: const Color(0xFF8892B0),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "© 2024 All rights reserved",
            style: GoogleFonts.inter(
              fontSize: 12,
              color: const Color(0xFF8892B0).withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIconButton(IconData icon, String url, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => UrlHelper.launchURL(url),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF112240).withValues(alpha: 0.8),
                  const Color(0xFF1A2F4F).withValues(alpha: 0.6),
                ],
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF64FFDA).withValues(alpha: 0.2),
                  blurRadius: 15,
                ),
              ],
            ),
            child: FaIcon(
              icon,
              size: 22,
              color: const Color(0xFF64FFDA),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialSideBar() {
    return Column(
      children: [
        _socialIconBtn(FontAwesomeIcons.github, AppConstants.gitHubUrl),
        const SizedBox(height: 20),
        _socialIconBtn(FontAwesomeIcons.linkedin, AppConstants.linkedInUrl),
        const SizedBox(height: 20),
        Container(width: 1, height: 100, color: Colors.grey),
      ],
    );
  }

  Widget _socialIconBtn(IconData icon, String url) {
    return IconButton(
      icon: FaIcon(icon, size: 20, color: Colors.white70),
      hoverColor: const Color(AppConstants.primaryColorValue),
      onPressed: () => UrlHelper.launchURL(url),
    );
  }

  Widget _navBtn(String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: GoogleFonts.inter(
              color: const Color(0xFF8892B0),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String num, String title) {
    return FadeInLeft(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF64FFDA), Color(0xFF00D9A5)],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              num,
              style: GoogleFonts.firaCode(
                color: const Color(0xFF0A192F),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF64FFDA).withValues(alpha: 0.5),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      backgroundColor: const Color(AppConstants.cardColorValue),
      child: ListView(
        padding: const EdgeInsets.all(40),
        children: [
          const SizedBox(height: 50),
          _navBtn("Experience", () {
            Navigator.pop(context);
            _scrollToSection(700);
          }),
          const SizedBox(height: 20),
          _navBtn("Skills", () {
            Navigator.pop(context);
            _scrollToSection(1400);
          }),
          const SizedBox(height: 20),
          _navBtn("Projects", () {
            Navigator.pop(context);
            _scrollToSection(2200);
          }),
          const SizedBox(height: 20),
          _navBtn("Contact", () {
            Navigator.pop(context);
            _scrollToSection(3000);
          }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
