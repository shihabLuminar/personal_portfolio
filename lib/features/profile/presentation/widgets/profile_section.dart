import 'package:flutter/material.dart';
import '../../../../core/responsive/responsive.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = context.isDesktop;
    final isMobile = context.isMobile;
    final isDark = theme.brightness == Brightness.dark;

    final avatarRadius = isMobile ? 60.0 : 80.0;
    final avatar = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: CircleAvatar(
        radius: avatarRadius,
        backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
        child: Icon(
          Icons.person,
          size: avatarRadius + 20,
          color: theme.colorScheme.primary,
        ),
      ),
    );

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.secondary,
            ],
          ).createShader(bounds),
          child: Text(
            'Hi, I\'m a Flutter Developer',
            style: (isMobile ? theme.textTheme.headlineMedium : theme.textTheme.displaySmall)
                ?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I craft performant, responsive, and beautiful cross‑platform apps for web, mobile, and desktop.',
          style: theme.textTheme.titleMedium?.copyWith(
            color: isDark ? Colors.grey[300] : Colors.grey[700],
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.work, size: 18),
              label: const Text('Hire Me'),
              style: FilledButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.file_download, size: 18),
              label: const Text('Download CV'),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          children: [
            _SocialButton(
              icon: Icons.code,
              label: 'GitHub',
              onTap: () {},
              color: theme.colorScheme.primary,
            ),
            _SocialButton(
              icon: Icons.business_center,
              label: 'LinkedIn',
              onTap: () {},
              color: theme.colorScheme.primary,
            ),
            _SocialButton(
              icon: Icons.email,
              label: 'Email',
              onTap: () {},
              color: theme.colorScheme.primary,
            ),
          ],
        ),
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
        const SizedBox(height: 32),
        info,
      ],
    );
  }
}

class _SocialButton extends StatefulWidget {
  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: OutlinedButton.icon(
          onPressed: widget.onTap,
          icon: Icon(widget.icon, size: 18),
          label: Text(widget.label),
          style: OutlinedButton.styleFrom(
            foregroundColor: _isHovered ? widget.color : null,
            side: BorderSide(
              color: _isHovered ? widget.color : Colors.grey[300]!,
              width: _isHovered ? 2 : 1,
            ),
          ),
        ),
      ),
    );
  }
}


