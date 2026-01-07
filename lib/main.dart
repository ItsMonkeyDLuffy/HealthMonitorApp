import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/health_provider.dart';
import 'widgets/responsive_layout.dart';
import 'package:health_monitor_app/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/home_page_web.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HealthProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      // HERE IS THE CHANGE:
      // We pass the Mobile layout to 'mobile'
      // We pass the Web/Row layout to 'desktop' and 'tablet'
      home: ResponsiveLayout(
        mobile: const HomePage(),
        tablet: const HomePageWeb(), // You need to create this (see step 2)
        desktop: const HomePageWeb(), // You need to create this (see step 2)
      ),
    );
  }
}
