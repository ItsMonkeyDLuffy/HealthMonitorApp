import 'package:flutter/material.dart';
import '../widgets/metric_card.dart';

class LungsScreen extends StatelessWidget {
  const LungsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
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
            title: "Respiration Rate",
            beforeVal: "18 bpm",
            afterVal: "16 bpm",
            percentage: "↓ 11% better",
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "Lung Capacity analysis pending...",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
