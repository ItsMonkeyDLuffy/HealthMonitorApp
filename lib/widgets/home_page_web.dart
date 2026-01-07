import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/appbar.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/anatomy_widget.dart';
import '../widgets/content_switcher.dart';

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
