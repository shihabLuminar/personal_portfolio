import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/constants/app_colors.dart';
import 'package:personal_portfolio/src/core/utils/responsive.dart';
import 'package:personal_portfolio/src/features/home/presentation/widgets/nav_bar.dart';
import 'package:personal_portfolio/src/features/home/presentation/widgets/section_container.dart';
import 'package:personal_portfolio/src/features/sections/about/about_section.dart';
import 'package:personal_portfolio/src/features/sections/contact/contact_section.dart';
import 'package:personal_portfolio/src/features/sections/profile/profile_section.dart';
import 'package:personal_portfolio/src/features/sections/projects/projects_section.dart';
import 'package:personal_portfolio/src/features/sections/services/services_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final Map<String, GlobalKey> _sectionKeys = {
    'profile': GlobalKey(),
    'about': GlobalKey(),
    'services': GlobalKey(),
    'projects': GlobalKey(),
    'contact': GlobalKey(),
  };

  void _scrollTo(String id) {
    final key = _sectionKeys[id];
    if (key == null) return;
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: Responsive.isMobile(context) ? 0 : 0.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(onSelect: _scrollTo),
      body: Container(
        color: AppColors.background,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SectionContainer(
                key: _sectionKeys['profile'],
                background: AppColors.surface,
                child: const ProfileSection(),
              ),
              SectionContainer(
                key: _sectionKeys['about'],
                child: const AboutSection(),
              ),
              SectionContainer(
                key: _sectionKeys['services'],
                background: AppColors.surface,
                child: const ServicesSection(),
              ),
              SectionContainer(
                key: _sectionKeys['projects'],
                child: const ProjectsSection(),
              ),
              SectionContainer(
                key: _sectionKeys['contact'],
                background: AppColors.surface,
                child: const ContactSection(),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
