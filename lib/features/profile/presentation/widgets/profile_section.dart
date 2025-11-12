import 'package:flutter/material.dart';
import '../../../../core/responsive/responsive.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = context.isDesktop;
    final isMobile = context.isMobile;

    final avatarRadius = isMobile ? 52.0 : 72.0;
    final avatar = CircleAvatar(
      radius: avatarRadius,
      backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
      child: Icon(
        Icons.person,
        size: avatarRadius + 24,
        color: theme.colorScheme.primary,
      ),
    );
    final info = Column(
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, I’m a Flutter Developer',
          style: (isMobile ? theme.textTheme.headlineMedium : theme.textTheme.displaySmall)
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          'I craft performant, responsive, and beautiful cross‑platform apps for web, mobile, and desktop.',
          style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[800]),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.work), label: const Text('Hire Me')),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.file_download), label: const Text('Download CV')),
          ],
        )
      ],
    );
    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: info),
          const SizedBox(width: 24),
          avatar,
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: avatar),
        const SizedBox(height: 24),
        info,
      ],
    );
  }
}


