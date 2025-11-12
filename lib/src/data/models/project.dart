class Project {
  Project({
    required this.name,
    required this.description,
    required this.technologies,
    this.repoUrl,
    this.demoUrl,
  });

  final String name;
  final String description;
  final List<String> technologies;
  final String? repoUrl;
  final String? demoUrl;
}
