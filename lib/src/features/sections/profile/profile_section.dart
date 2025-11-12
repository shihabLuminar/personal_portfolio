import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/constants/app_colors.dart';
import 'package:personal_portfolio/src/core/utils/responsive.dart';
import 'package:personal_portfolio/src/data/datasource/static_data.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final p = StaticData.profile;
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 16 : 32),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: isMobile ? 48 : 64,
            backgroundColor: AppColors.primary.withOpacity(0.1),
            child: Text(
              p.name.split(' ').map((e) => e[0]).take(2).join(),
              style: TextStyle(
                fontSize: isMobile ? 28 : 36,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(width: isMobile ? 0 : 32, height: isMobile ? 16 : 0),
          Expanded(
            child: Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(p.name, style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 8),
                Text(
                  '${p.title} • ${p.location}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  p.summary,
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.mail_outline),
                      label: Text(p.email),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.link),
                      label: const Text('LinkedIn'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.code),
                      label: const Text('GitHub'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
