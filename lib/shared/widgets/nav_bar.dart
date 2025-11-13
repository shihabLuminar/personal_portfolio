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
        color: (theme.appBarTheme.backgroundColor ?? Colors.white).withOpacity(0.95),
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.1)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
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

class _NavButton extends StatefulWidget {
  const _NavButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _isHovered ? theme.colorScheme.primary.withOpacity(0.1) : Colors.transparent,
        ),
        child: TextButton(
          onPressed: widget.onTap,
          style: TextButton.styleFrom(
            foregroundColor: _isHovered ? theme.colorScheme.primary : null,
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
