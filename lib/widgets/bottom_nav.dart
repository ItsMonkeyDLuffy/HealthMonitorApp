import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/health_provider.dart';
import '../utils/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 100),
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Consumer<HealthProvider>(
        builder: (context, provider, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIcon(context, 0, Icons.psychology, provider),
              _buildIcon(context, 1, Icons.favorite, provider),
              _buildIcon(context, 2, Icons.air, provider),
            ],
          );
        },
      ),
    );
  }

  Widget _buildIcon(
    BuildContext context,
    int index,
    IconData icon,
    HealthProvider provider,
  ) {
    bool isSelected = provider.selectedIndex == index;
    Color activeColor;

    switch (index) {
      case 0:
        activeColor = const Color.fromARGB(255, 102, 145, 160);
        break;
      case 1:
        activeColor = AppColors.heartColor;
        break;
      case 2:
        activeColor = const Color.fromARGB(255, 153, 208, 235);
        break;
      default:
        activeColor = Colors.blue;
    }

    return GestureDetector(
      onTap: () => provider.setIndex(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black12, blurRadius: 5)]
              : [],
        ),
        child: Icon(
          icon,
          color: isSelected ? activeColor : Colors.grey,
          size: 24,
        ),
      ),
    );
  }
}
