import 'package:flutter/material.dart';
import '../../core/responsive/responsive.dart';

enum PortfolioSection { profile, about, services, projects, contact }

typedef SectionTap = void Function(PortfolioSection section);

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({
    super.key,
    required this.onSectionTap,
    required this.isDarkMode,
    required this.onToggleThemeMode,
  });

  final SectionTap onSectionTap;
  final bool isDarkMode;
  final VoidCallback onToggleThemeMode;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;
    final isMobile = context.isMobile;
    return Container(
      height: preferredSize.height,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: theme.appBarTheme.backgroundColor ?? Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.15)),
        ),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Icon(Icons.flutter_dash, color: color),
              const SizedBox(width: 8),
              Text(
                'Flutter Dev',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const Spacer(),
          if (!isMobile)
            Wrap(
              spacing: 16,
              children: [
                _NavButton(
                  label: 'Profile',
                  onTap: () => onSectionTap(PortfolioSection.profile),
                ),
                _NavButton(
                  label: 'About',
                  onTap: () => onSectionTap(PortfolioSection.about),
                ),
                _NavButton(
                  label: 'Services',
                  onTap: () => onSectionTap(PortfolioSection.services),
                ),
                _NavButton(
                  label: 'Projects',
                  onTap: () => onSectionTap(PortfolioSection.projects),
                ),
                FilledButton(
                  onPressed: () => onSectionTap(PortfolioSection.contact),
                  child: const Text('Contact'),
                ),
              ],
            ),
          IconButton(
            tooltip: isDarkMode ? 'Switch to light' : 'Switch to dark',
            onPressed: onToggleThemeMode,
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
          if (isMobile)
            Builder(
              builder: (context) => IconButton(
                tooltip: 'Menu',
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu),
              ),
            ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(label));
  }
}
