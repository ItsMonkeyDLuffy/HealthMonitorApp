import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../providers/health_provider.dart';

class AnatomyWidget extends StatelessWidget {
  final double height;

  const AnatomyWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      // FIXED: Increased AspectRatio from 0.6 to 0.85
      // This widens the box so the human shoulders fit without shrinking the whole image.
      child: AspectRatio(
        aspectRatio: 0.85,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double h = constraints.maxHeight;

            return ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.white, Colors.transparent],
                  stops: [0.0, 0.7, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // Base Body
                  Positioned.fill(
                    child: SvgPicture.asset(
                      'assets/images/human.svg',
                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                        Colors.grey.withValues(alpha: 0.3),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),

                  // BRAIN
                  // Re-aligned for the wider 0.85 box
                  Align(
                    alignment: Alignment(0.0, -1.0),
                    child: Consumer<HealthProvider>(
                      builder: (context, provider, _) {
                        return Image.asset(
                          provider.selectedIndex == 0
                              ? 'assets/images/brain_red.png'
                              : 'assets/images/brain.png',
                          height: h * 0.23, // Restored size
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),

                  // LUNGS
                  Align(
                    alignment: Alignment(0.0, 0.35),
                    child: Consumer<HealthProvider>(
                      builder: (context, provider, _) {
                        return Image.asset(
                          provider.selectedIndex == 2
                              ? 'assets/images/lungs_red.png'
                              : 'assets/images/lungs.png',
                          height: h * 0.45,
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),

                  // HEART
                  Align(
                    alignment: Alignment(0.12, 0.15),
                    child: Consumer<HealthProvider>(
                      builder: (context, provider, _) {
                        return Image.asset(
                          provider.selectedIndex == 1
                              ? 'assets/images/heart_red.png'
                              : 'assets/images/heart.png',
                          height: h * 0.15,
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
