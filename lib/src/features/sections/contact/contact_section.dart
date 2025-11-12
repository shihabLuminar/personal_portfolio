import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/constants/app_sizes.dart';
import 'package:personal_portfolio/src/core/widgets/section_header.dart';
import 'package:personal_portfolio/src/data/datasource/static_data.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final p = StaticData.profile;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Contact',
          subtitle: 'Let’s build something great together.',
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.gutter),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get in touch',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text('Email: ${p.email}'),
                const SizedBox(height: 8),
                Text('LinkedIn: ${p.linkedin}'),
                const SizedBox(height: 8),
                Text('GitHub: ${p.github}'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
