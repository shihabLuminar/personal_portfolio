import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/constants/app_colors.dart';
import 'package:personal_portfolio/src/core/utils/responsive.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
	const NavBar({
		super.key,
		required this.onSelect,
	});

	final void Function(String id) onSelect;

	@override
	Size get preferredSize => const Size.fromHeight(64);

	@override
	Widget build(BuildContext context) {
		final items = [
			('profile', 'Profile'),
			('about', 'About'),
			('services', 'Services'),
			('projects', 'Projects'),
			('contact', 'Contact'),
		];

		return Container(
			decoration: const BoxDecoration(
				color: Colors.white,
				border: Border(
					bottom: BorderSide(color: AppColors.divider),
				),
			),
			child: SafeArea(
				bottom: false,
				child: Padding(
					padding: const EdgeInsets.symmetric(horizontal: 16),
					child: Row(
						children: [
							const Text(
								'Portfolio',
								style: TextStyle(
									fontSize: 18,
									fontWeight: FontWeight.w700,
								),
							),
							const Spacer(),
							if (Responsive.isMobile(context))
								PopupMenuButton<String>(
									onSelected: onSelect,
									itemBuilder: (context) => items
										.map((e) => PopupMenuItem(
											value: e.$1,
											child: Text(e.$2),
										))
										.toList(),
									icon: const Icon(Icons.menu),
								)
							else
								Row(
									children: items
										.map(
											(e) => TextButton(
												onPressed: () => onSelect(e.$1),
												child: Text(
													e.$2,
													style: const TextStyle(
														color: AppColors.textPrimary,
														fontWeight: FontWeight.w600,
													),
												),
											),
										)
										.toList(),
								),
						],
					),
				),
			),
		);
	}
}


