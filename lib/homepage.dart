import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../providers/health_provider.dart';
import '../utils/app_colors.dart';
import '../widgets/appbar.dart';
import '../widgets/bottom_nav.dart';
import '../screens/brain_screen.dart';
import '../screens/heart_screen.dart';
import '../screens/lungs_screen.dart';

// =======================================================
// 1. MOBILE LAYOUT (Portrait)
// =======================================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Mobile anatomy height
    final double mapHeight = size.height * 0.40;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.backgroundTop, AppColors.backgroundBottom],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Stack(
                      children: [
                        // --- BACKGROUND LAYER (Anatomy) ---
                        Positioned(
                          top: size.height * 0.12,
                          left: 0,
                          right: 0,
                          height: mapHeight,
                          child: Center(
                            child: AnatomyWidget(height: mapHeight),
                          ),
                        ),

                        // --- FOREGROUND LAYER (Content) ---
                        Column(
                          children: [
                            CustomAppBar(),
                            Spacer(),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ContentSwitcher(),
                                  SizedBox(height: 20),
                                  CustomBottomNav(),
                                  SizedBox(height: 10),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Skip",
                                      style: TextStyle(
                                        color: AppColors.primaryText,
                                        decoration: TextDecoration.underline,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// =======================================================
// 2. WEB / TABLET LAYOUT (Landscape)
// =======================================================
class HomePageWeb extends StatelessWidget {
  const HomePageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.backgroundTop, AppColors.backgroundBottom],
          ),
        ),
        child: SafeArea(
          child: Row(
            children: [
              // --- LEFT SIDE: Anatomy & Title ---
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomAppBar(),
                    Expanded(
                      // Removed padding to allow image to be bigger
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Center(
                            child: AnatomyWidget(
                              height:
                                  constraints.maxHeight *
                                  0.90, // Use 90% of height
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // --- RIGHT SIDE: Content Card ---
              Expanded(
                flex: 1,
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 450),
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ContentSwitcher(),
                          SizedBox(height: 30),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: CustomBottomNav(),
                          ),
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                color: AppColors.primaryText,
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =======================================================
// 3. REUSABLE WIDGETS
// =======================================================

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
