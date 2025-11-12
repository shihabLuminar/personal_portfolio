import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/constants/app_colors.dart';
import 'package:personal_portfolio/src/core/constants/app_sizes.dart';
import 'package:personal_portfolio/src/core/widgets/section_header.dart';
import 'package:personal_portfolio/src/data/datasource/static_data.dart';

class ProjectsSection extends StatelessWidget {
	const ProjectsSection({super.key});

	@override
	Widget build(BuildContext context) {
		final projects = StaticData.projects;

		return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: [
				const SectionHeader(
					title: 'Projects',
					subtitle: 'Selected work and open-source contributions.',
				),
				const SizedBox(height: 24),
				ListView.separated(
					itemCount: projects.length,
					shrinkWrap: true,
					physics: const NeverScrollableScrollPhysics(),
					separatorBuilder: (_, __) => const SizedBox(height: 12),
					itemBuilder: (context, index) {
						final p = projects[index];
						return Card(
							child: Padding(
								padding: const EdgeInsets.all(AppSizes.gutter),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Text(p.name, style: Theme.of(context).textTheme.titleLarge),
										const SizedBox(height: 8),
										Text(p.description),
										const SizedBox(height: 12),
										Wrap(
											spacing: 8,
											runSpacing: 8,
											children: p.technologies
												.map(
													(t) => Chip(
														label: Text(t),
														backgroundColor: AppColors.background,
													),
												)
												.toList(),
										),
										if (p.repoUrl != null || p.demoUrl != null) ...[
											const SizedBox(height: 12),
											Wrap(
												spacing: 8,
												children: [
													if (p.repoUrl != null)
														TextButton.icon(
															onPressed: () {},
															icon: const Icon(Icons.code),
															label: const Text('Source'),
														),
													if (p.demoUrl != null)
														TextButton.icon(
															onPressed: () {},
															icon: const Icon(Icons.open_in_new),
															label: const Text('Live Demo'),
														),
												],
											),
										],
									],
								),
							),
						);
					},
				),
			],
		);
	}
}


