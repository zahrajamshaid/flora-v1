import 'package:flora/presentation/dashboard_page/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flora/presentation/signup_screen/signup_screen.dart';
import 'package:flora/presentation/login_screen/login_screen.dart';
import 'package:flora/presentation/otp_screen/otp_screen.dart';
import 'package:flora/presentation/dashboard_container_screen/dashboard_container_screen.dart';
import 'package:flora/presentation/scanning_screen/scanning_screen.dart';
import 'package:flora/presentation/profile_screen/profile_screen.dart';
import 'package:flora/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:flora/presentation/splash_screen/splash_screen.dart';
import 'package:flora/presentation/community_screen/community_screen.dart';
import 'package:flora/presentation/side_navigation_screen/side_navigation_screen.dart';
import 'package:flora/presentation/onboarding_three_screen/onboarding_three_screen.dart';
import 'package:flora/presentation/notifications_screen/notifications_screen.dart';
import 'package:flora/presentation/onboarding_two_screen/onboarding_two_screen.dart';
import 'package:flora/presentation/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:flora/presentation/communities_one_screen/communities_one_screen.dart';
import 'package:flora/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String signupScreen = '/signup_screen';

  static const String communitiesPage = '/communities_page';

  static const String loginScreen = '/login_screen';

  static const String otpScreen = '/otp_screen';

  static const String dashboardPage = '/dashboard_page';

  static const String dashboardContainerScreen = '/dashboard_container_screen';

  static const String scanningScreen = '/scanning_screen';

  static const String profileScreen = '/profile_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  

  static const String communityScreen = '/community_screen';

  static const String sideNavigationScreen = '/side_navigation_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String communitiesOneScreen = '/communities_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    appNavigationScreen: (context) => AppNavigationScreen(),
    splashScreen: (context) => SplashScreen(),
  onboardingOneScreen: (context) => OnboardingOneScreen(),
   onboardingTwoScreen: (context) => OnboardingTwoScreen(),
   onboardingThreeScreen: (context) => OnboardingThreeScreen(),
    otpScreen: (context) => OtpScreen(),
   signupScreen: (context) => SignupScreen(),
    loginScreen: (context) => LoginScreen(),

    dashboardContainerScreen: (context) =>  DashboardPage(),
    dashboardPage: (context) => DashboardPage(),

    scanningScreen: (context) => ScanningScreen(),
    profileScreen: (context) => ProfileScreen(),
    editProfileScreen: (context) => EditProfileScreen(),
   
    communityScreen: (context) => CommunityScreen(),
    sideNavigationScreen: (context) => SideNavigationScreen(),
  
    notificationsScreen: (context) => NotificationsScreen(),
   
    communitiesOneScreen: (context) => CommunitiesOneScreen(),
  
  };
}
