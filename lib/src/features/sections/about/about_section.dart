import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'About',
          subtitle: 'A bit about who I am and how I work.',
        ),
        const SizedBox(height: 24),
        Text(
          'I am a Flutter developer focused on building fast, reliable apps with clean architecture, maintainable code, and thoughtful UX. I enjoy collaborating with teams, mentoring, and shipping quality features.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'My approach emphasizes predictable state management, strong typing, testing, and performance profiling — ensuring your app scales and remains easy to evolve.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
