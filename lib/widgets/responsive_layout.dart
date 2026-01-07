import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Desktop Mode (Width > 1100)
        if (constraints.maxWidth >= 1100) {
          // If a desktop layout is provided, use it.
          // If not, try tablet. If neither, stretch the mobile view.
          return desktop ?? tablet ?? mobile;
        }
        // Tablet / Landscape Mode (Width between 600 and 1100)
        else if (constraints.maxWidth >= 600) {
          return tablet ?? mobile;
        }
        // Mobile Mode (Width < 600)
        else {
          return mobile;
        }
      },
    );
  }
}
