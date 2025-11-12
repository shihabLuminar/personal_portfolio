import 'package:personal_portfolio/src/data/models/profile.dart';
import 'package:personal_portfolio/src/data/models/project.dart';
import 'package:personal_portfolio/src/data/models/service.dart';

class StaticData {
  StaticData._();

  static final profile = Profile(
    name: 'Shihab K Saleem',
    title: 'Flutter Developer',
    location: 'Ernakulam, India',
    summary:
        'I build high-quality Flutter apps for mobile and web with clean architecture and great UX.',
    email: 'you@example.com',
    linkedin: 'https://www.linkedin.com/in/shihabksaleem',
    github: 'https://github.com/shihabksaleem',
  );

  static final services = <Service>[
    Service(
      title: 'Flutter App Development',
      description: 'End-to-end app development for iOS, Android, and Web.',
      tools: ['Flutter', 'Dart', 'Material 3', 'Firebase'],
    ),
    Service(
      title: 'Architecture & Code Quality',
      description: 'Scalable architectures, testing, and code reviews.',
      tools: ['Bloc', 'Riverpod', 'Clean Architecture'],
    ),
    Service(
      title: 'CI/CD & Release',
      description: 'Automated builds, testing, and store deployments.',
      tools: ['GitHub Actions', 'Fastlane', 'Codemagic'],
    ),
  ];

  static final projects = <Project>[
    Project(
      name: 'Portfolio Web',
      description:
          'Responsive Flutter web portfolio showcasing projects and services.',
      technologies: ['Flutter', 'Dart', 'Material 3'],
      repoUrl: 'https://github.com/your-handle/portfolio',
    ),
    Project(
      name: 'Task Manager',
      description:
          'Cross-platform task manager with offline sync and notifications.',
      technologies: ['Flutter', 'Riverpod', 'SQLite'],
    ),
    Project(
      name: 'E-commerce App',
      description: 'Modern e-commerce app with wishlist, cart, and payments.',
      technologies: ['Flutter', 'Bloc', 'Stripe'],
    ),
  ];
}
