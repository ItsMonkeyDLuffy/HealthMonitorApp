import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'providers/health_provider.dart';
import 'utils/app_colors.dart';
import 'widgets/appbar.dart';
import 'widgets/bottom_nav.dart';
import 'screens/brain_screen.dart';
import 'screens/heart_screen.dart';
import 'screens/lungs_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: size.height * 0.12,
                left: 0,
                right: 0,
                height: mapHeight,
                child: ShaderMask(
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
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/images/human.svg',
                          height: mapHeight,
                          fit: BoxFit.contain,
                          colorFilter: ColorFilter.mode(
                            Colors.grey.withValues(alpha: 0.3),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment(0.0, -1.05),
                        child: Consumer<HealthProvider>(
                          builder: (context, provider, _) {
                            bool isSelected = provider.selectedIndex == 0;
                            return Image.asset(
                              isSelected
                                  ? 'assets/images/brain_red.png'
                                  : 'assets/images/brain.png',
                              height: mapHeight * 0.25,
                              fit: BoxFit.contain,
                            );
                          },
                        ),
                      ),

                      Align(
                        alignment: Alignment(0.0, 0.3),
                        child: Consumer<HealthProvider>(
                          builder: (context, provider, _) {
                            bool isSelected = provider.selectedIndex == 2;
                            return Image.asset(
                              isSelected
                                  ? 'assets/images/lungs_red.png' // Back to SVG
                                  : 'assets/images/lungs.png',
                              height: mapHeight * 0.45,
                              fit: BoxFit.contain,
                            );
                          },
                        ),
                      ),

                      Align(
                        alignment: Alignment(0.10, 0.15),
                        child: Consumer<HealthProvider>(
                          builder: (context, provider, _) {
                            bool isSelected = provider.selectedIndex == 1;
                            return Image.asset(
                              isSelected
                                  ? 'assets/images/heart_red.png'
                                  : 'assets/images/heart.png',
                              height: mapHeight * 0.15,
                              fit: BoxFit.contain,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

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
                        Consumer<HealthProvider>(
                          builder: (context, provider, child) {
                            Widget screen;
                            if (provider.selectedIndex == 0) {
                              screen = BrainScreen();
                            } else if (provider.selectedIndex == 1) {
                              screen = HeartScreen();
                            } else {
                              screen = LungsScreen();
                            }
                            return screen;
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                        CustomBottomNav(),
                        SizedBox(height: size.height * 0.01),
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
                        SizedBox(height: 10),
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
  }
}
