import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/constants/app_colors.dart';
import 'package:personal_portfolio/src/core/constants/app_sizes.dart';
import 'package:personal_portfolio/src/core/widgets/section_header.dart';
import 'package:personal_portfolio/src/data/datasource/static_data.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = StaticData.services;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Services',
          subtitle: 'What I can help you with.',
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 900
                ? 3
                : constraints.maxWidth > 650
                ? 2
                : 1;
            return GridView.builder(
              itemCount: services.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 4 / 3,
              ),
              itemBuilder: (context, index) {
                final s = services[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.gutter),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          s.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(s.description),
                        const Spacer(),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: s.tools
                              .map(
                                (t) => Chip(
                                  label: Text(t),
                                  backgroundColor: AppColors.background,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
