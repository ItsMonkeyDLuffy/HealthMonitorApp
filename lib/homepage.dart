import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/appbar.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/anatomy_widget.dart';
import '../widgets/content_switcher.dart';

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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Stack(
                      children: [
                        Positioned(
                          top: size.height * 0.12,
                          left: 0,
                          right: 0,
                          height: mapHeight,
                          child: Center(
                            child: AnatomyWidget(height: mapHeight),
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
