import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: AppColors.successText,
                    size: 20,
                  ),
                  SizedBox(width: 3),
                  Text(
                    "Completed",
                    style: TextStyle(
                      color: AppColors.successText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Icon(Icons.ios_share, color: Colors.black),
            ],
          ),
          SizedBox(height: 5),
          Text(
            "You did good!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          SizedBox(height: 2),
          Text(
            "05 Jul, 12:30pm",
            style: TextStyle(color: AppColors.secondaryText, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
