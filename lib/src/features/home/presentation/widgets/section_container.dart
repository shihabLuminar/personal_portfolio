import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/constants/app_sizes.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.background,
    this.padding,
  });

  final Widget child;
  final Color? background;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      padding:
          padding ??
          const EdgeInsets.symmetric(
            vertical: AppSizes.sectionSpacing,
            horizontal: 16,
          ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.pageMaxWidth),
          child: child,
        ),
      ),
    );
  }
}
