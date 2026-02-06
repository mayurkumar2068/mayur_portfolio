import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../models/project_model.dart';
import '../utilities/url_helper.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: isHovered
              ? Matrix4.translationValues(0, -15, 0)
              : Matrix4.identity(),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF112240).withValues(alpha: 0.9),
                const Color(0xFF1A2F4F).withValues(alpha: 0.7),
              ],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isHovered
                  ? const Color(0xFF64FFDA)
                  : const Color(0xFF64FFDA).withValues(alpha: 0.2),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? const Color(0xFF64FFDA).withValues(alpha: 0.4)
                    : Colors.black.withValues(alpha: 0.3),
                blurRadius: isHovered ? 40 : 20,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                // Gradient overlay
                Positioned(
                  top: -100,
                  right: -100,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFF64FFDA).withValues(alpha: 0.1),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF64FFDA), Color(0xFF00D9A5)],
                              ),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF64FFDA).withValues(alpha: 0.4),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.folder_open_rounded,
                              size: 40,
                              color: Color(0xFF0A192F),
                            ),
                          ),
                          if (widget.project.link != null)
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF64FFDA).withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                                ),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.open_in_new_rounded,
                                  color: Color(0xFF64FFDA),
                                ),
                                onPressed: () => UrlHelper.launchURL(widget.project.link!),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        widget.project.title,
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF64FFDA).withValues(alpha: 0.2),
                              const Color(0xFF00D9A5).withValues(alpha: 0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.project.subtitle,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: const Color(0xFF64FFDA),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        widget.project.description,
                        style: GoogleFonts.inter(
                          height: 1.8,
                          fontSize: 16,
                          color: const Color(0xFF8892B0),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: widget.project.technologies
                            .map(
                              (tech) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF233554),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xFF64FFDA).withValues(alpha: 0.2),
                                  ),
                                ),
                                child: Text(
                                  tech,
                                  style: GoogleFonts.firaCode(
                                    fontSize: 13,
                                    color: const Color(0xFF64FFDA),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
