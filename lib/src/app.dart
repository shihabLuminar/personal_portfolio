import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/theme/app_theme.dart';
import 'package:personal_portfolio/src/features/home/presentation/pages/home_page.dart';

class PortfolioApp extends StatelessWidget {
	const PortfolioApp({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Developer | Portfolio',
			debugShowCheckedModeBanner: false,
			theme: AppTheme.light,
			home: const HomePage(),
		);
	}
}


