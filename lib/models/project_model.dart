class Project {
  final String title;
  final String subtitle;
  final String description;
  final List<String> technologies;
  final String? link;

  Project({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.technologies,
    this.link,
  });
}
