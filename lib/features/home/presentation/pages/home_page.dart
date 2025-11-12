import 'package:flutter/material.dart';
import '../../../../shared/widgets/nav_bar.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../profile/presentation/widgets/profile_section.dart';
import '../../../about/presentation/widgets/about_section.dart';
import '../../../services/presentation/widgets/services_section.dart';
import '../../../projects/presentation/widgets/projects_section.dart';
import '../../../contact/presentation/widgets/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleThemeMode,
  });

  final bool isDarkMode;
  final VoidCallback onToggleThemeMode;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final Map<PortfolioSection, GlobalKey> _sectionKeys = {
    PortfolioSection.profile: GlobalKey(),
    PortfolioSection.about: GlobalKey(),
    PortfolioSection.services: GlobalKey(),
    PortfolioSection.projects: GlobalKey(),
    PortfolioSection.contact: GlobalKey(),
  };

  Future<void> _scrollTo(PortfolioSection section) async {
    final key = _sectionKeys[section];
    if (key?.currentContext == null) return;
    await Scrollable.ensureVisible(
      key!.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        onSectionTap: _scrollTo,
        isDarkMode: widget.isDarkMode,
        onToggleThemeMode: widget.onToggleThemeMode,
      ),
      drawer: _MobileDrawer(
        onSelect: (section) {
          Navigator.of(context).pop();
          _scrollTo(section);
        },
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _SectionContainer(
                key: _sectionKeys[PortfolioSection.profile],
                child: const ProfileSection(),
              ),
              _SectionContainer(
                key: _sectionKeys[PortfolioSection.about],
                child: const AboutSection(),
              ),
              _SectionContainer(
                key: _sectionKeys[PortfolioSection.services],
                child: const ServicesSection(),
              ),
              _SectionContainer(
                key: _sectionKeys[PortfolioSection.projects],
                child: const ProjectsSection(),
              ),
              _SectionContainer(
                key: _sectionKeys[PortfolioSection.contact],
                child: const ContactSection(),
              ),
              const SizedBox(height: 32),
              const _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionContainer extends StatelessWidget {
  const _SectionContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontal = width < Breakpoints.mobile
        ? 16.0
        : (width < Breakpoints.tablet ? 20.0 : 24.0);
    final vertical = width < Breakpoints.mobile
        ? 32.0
        : (width < Breakpoints.tablet ? 40.0 : 48.0);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      alignment: Alignment.center,
      child: Text(
        '© ${DateTime.now().year} Flutter Developer • Built with Flutter',
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
      ),
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({required this.onSelect});
  final void Function(PortfolioSection section) onSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () => onSelect(PortfolioSection.profile),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () => onSelect(PortfolioSection.about),
            ),
            ListTile(
              leading: const Icon(Icons.home_repair_service),
              title: const Text('Services'),
              onTap: () => onSelect(PortfolioSection.services),
            ),
            ListTile(
              leading: const Icon(Icons.apps),
              title: const Text('Projects'),
              onTap: () => onSelect(PortfolioSection.projects),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: FilledButton(
                onPressed: () => onSelect(PortfolioSection.contact),
                child: const Text('Contact'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
