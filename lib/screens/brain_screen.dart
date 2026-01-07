import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/health_provider.dart';
import '../utils/app_colors.dart';

class BrainScreen extends StatelessWidget {
  const BrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HealthProvider>(
      builder: (context, provider, child) {
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
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Stress Level",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.show_chart, color: Colors.grey, size: 20),
                  SizedBox(width: 10),
                  Icon(Icons.info_outline, color: Colors.grey, size: 20),
                ],
              ),
              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Relaxation Index",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "${provider.stressLevel.toInt()}%",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Text(
                      provider.stressLevel > 50
                          ? "You're Stressed"
                          : "You're Relaxed",
                      style: TextStyle(
                        color: provider.stressLevel > 50
                            ? AppColors.brainColor
                            : Colors
                                  .green, // Changed to standard green if AppColors.successText is missing
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: provider.stressLevel / 100,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    provider.stressLevel <= 50
                        ? const Color.fromARGB(255, 115, 218, 165)
                        : const Color.fromARGB(255, 233, 41, 41),
                  ),
                  minHeight: 15,
                ),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: provider.decrementStress,
                    icon: Icon(Icons.remove_circle_outline),
                    tooltip: "Decrease Stress",
                  ),
                  Text("Adjust Level", style: TextStyle(color: Colors.grey)),
                  IconButton(
                    onPressed: provider.incrementStress,
                    icon: Icon(Icons.add_circle_outline),
                    tooltip: "Increase Stress",
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
