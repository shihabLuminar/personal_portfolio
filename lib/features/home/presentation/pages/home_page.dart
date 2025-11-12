import 'package:flutter/material.dart';
import '../../../../shared/widgets/nav_bar.dart';
import '../../../profile/presentation/widgets/profile_section.dart';
import '../../../about/presentation/widgets/about_section.dart';
import '../../../services/presentation/widgets/services_section.dart';
import '../../../projects/presentation/widgets/projects_section.dart';
import '../../../contact/presentation/widgets/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      appBar: NavBar(onSectionTap: _scrollTo),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
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
