import 'package:flutter/material.dart';
import '../../../../core/responsive/responsive.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < Breakpoints.mobile
        ? 1
        : (width < Breakpoints.tablet ? 2 : 3);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Projects', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: const [
            _ProjectCard(title: 'Portfolio Web', tech: 'Flutter Web • Responsive UI'),
            _ProjectCard(title: 'E‑Commerce App', tech: 'Flutter • Firebase • Stripe'),
            _ProjectCard(title: 'Chat App', tech: 'Flutter • WebSockets • Push'),
          ],
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.title, required this.tech});
  final String title;
  final String tech;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.apps, size: 48, color: theme.colorScheme.primary),
              ),
              const SizedBox(height: 12),
              Text(title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              Text(tech, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[800])),
            ],
          ),
        ),
      ),
    );
  }
}


