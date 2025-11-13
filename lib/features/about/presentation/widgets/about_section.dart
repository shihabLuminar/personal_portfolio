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

class _Chip extends StatefulWidget {
  const _Chip({required this.label});
  final String label;

  @override
  State<_Chip> createState() => _ChipState();
}

class _ChipState extends State<_Chip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _isHovered
              ? theme.colorScheme.primary.withOpacity(0.1)
              : (isDark ? const Color(0xFF1E293B) : Colors.white),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? theme.colorScheme.primary
                : Colors.grey.withOpacity(0.3),
            width: _isHovered ? 1.5 : 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
            color: _isHovered ? theme.colorScheme.primary : null,
          ),
        ),
      ),
    );
  }
}


