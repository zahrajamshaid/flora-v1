import 'package:flora/core/app_export.dart';
import 'package:flora/presentation/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {
    super.initState();
    // Add a delay of 2 seconds before navigating to the main screen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const OnboardingOneScreen(), // Replace with your main screen
        ),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.04, -0.02),
              end: Alignment(1.1, 0.8),
              colors: [
                theme.colorScheme.onSecondaryContainer.withOpacity(1),
                appTheme.teal300,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 107.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5.v),
                Image.asset(
                'lib/images/logo.png', // Replace with your logo image path
                width: 191, // Set your desired width
                height: 103, // Set your desired height
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
