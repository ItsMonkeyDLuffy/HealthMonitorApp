import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/health_provider.dart';
import '../screens/brain_screen.dart';
import '../screens/heart_screen.dart';
import '../screens/lungs_screen.dart';

class ContentSwitcher extends StatelessWidget {
  const ContentSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HealthProvider>(
      builder: (context, provider, child) {
        if (provider.selectedIndex == 0) {
          return BrainScreen();
        } else if (provider.selectedIndex == 1) {
          return HeartScreen();
        } else {
          return LungsScreen();
        }
      },
    );
  }
}
