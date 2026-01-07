import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class MetricRow extends StatelessWidget {
  final String title;
  final String beforeVal;
  final String afterVal;
  final String percentage;

  const MetricRow({
    required this.title,
    required this.beforeVal,
    required this.afterVal,
    required this.percentage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Icon(Icons.show_chart, color: Colors.grey, size: 20),
                SizedBox(width: 10),
                Icon(Icons.info_outline, color: Colors.grey, size: 20),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Before",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  beforeVal,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(width: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.successGreen,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                percentage,
                style: TextStyle(
                  color: AppColors.successText,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "After",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  afterVal,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
