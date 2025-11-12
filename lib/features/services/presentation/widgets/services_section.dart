import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Services', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        LayoutBuilder(builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;
          final crossAxisCount = isWide ? 3 : 1;
          return GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: crossAxisCount,
            childAspectRatio: isWide ? 1.4 : 2.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: const [
              _ServiceCard(
                icon: Icons.phone_iphone,
                title: 'Mobile Apps',
                desc: 'High-quality iOS & Android apps from a single codebase.',
              ),
              _ServiceCard(
                icon: Icons.web,
                title: 'Web Apps',
                desc: 'Responsive Flutter web experiences with smooth animations.',
              ),
              _ServiceCard(
                icon: Icons.speed,
                title: 'Performance & QA',
                desc: 'Profiling, testing, and optimization for smooth UX.',
              ),
            ],
          );
        }),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.icon, required this.title, required this.desc});
  final IconData icon;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: theme.colorScheme.primary, size: 32),
            const SizedBox(height: 12),
            Text(title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(desc, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[800])),
          ],
        ),
      ),
    );
  }
}


