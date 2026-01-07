import 'package:flutter/material.dart';
import '../widgets/metric_card.dart';

class HeartScreen extends StatelessWidget {
  const HeartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MetricRow(
            title: "Heart Rate",
            beforeVal: "100 bpm",
            afterVal: "95 bpm",
            percentage: "↓ 5% better",
          ),
          Divider(),
          SizedBox(height: 8),
          MetricRow(
            title: "SpO2",
            beforeVal: "100 %",
            afterVal: "97 %",
            percentage: "↓ 5% better",
          ),
        ],
      ),
    );
  }
}
