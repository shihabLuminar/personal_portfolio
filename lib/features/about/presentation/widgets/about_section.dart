import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About Me', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Text(
          'I’m a Flutter specialist focused on building scalable apps with clean architecture, testing, and CI/CD. '
          'I enjoy transforming ideas into delightful user experiences and optimizing for performance and accessibility.',
          style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[800]),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _Chip(label: 'Flutter'),
            _Chip(label: 'Dart'),
            _Chip(label: 'Firebase'),
            _Chip(label: 'REST & GraphQL'),
            _Chip(label: 'Clean Architecture'),
            _Chip(label: 'Unit & Widget Tests'),
          ],
        )
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      side: BorderSide(color: Colors.grey.withOpacity(0.3)),
      backgroundColor: Colors.white,
    );
  }
}


