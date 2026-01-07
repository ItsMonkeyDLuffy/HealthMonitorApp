import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;

  const ResponsiveLayout({super.key, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Center(
            child: SizedBox(
              width: 400,
              height: constraints.maxHeight,
              child: mobile,
            ),
          );
        }
        return mobile;
      },
    );
  }
}
