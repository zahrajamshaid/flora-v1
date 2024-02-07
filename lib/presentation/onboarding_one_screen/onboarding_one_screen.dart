import 'package:flora/core/app_export.dart';
import 'package:flora/presentation/onboarding_two_screen/onboarding_two_screen.dart';
import 'package:flora/presentation/signup_screen/signup_screen.dart';
import 'package:flora/widgets/custom_elevated_button.dart';
import 'package:flora/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class OnboardingOneScreen extends StatelessWidget {
  const OnboardingOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onSecondaryContainer.withOpacity(1),
        body: SizedBox(
          
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: 756.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 734.v,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(1),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(40.h),
                          ),
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgImage3RemovebgPreview,
                      height: 433.v,
                      width: 430.h,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 17.v),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 199.h,
                        margin: EdgeInsets.only(bottom: 155.v),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Welcome to",
                                style: CustomTextStyles.titleSmallOnPrimaryBold,
                              ),
                              TextSpan(
                                text: "  ",
                              ),
                              TextSpan(
                                text: "  ",
                              ),
                              TextSpan(
                                text: "flora.\n",
                                style: theme.textTheme.displaySmall,
                              ),
                              TextSpan(
                                text:
                                    "\n\nyour ultimate guide to discovering and identifying plants with ease! Whether you're a gardening enthusiast, a nature lover, or simply curious about the flora around you, our app is here to help. Let's embark on a journey of botanical exploration together.",
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      width: 212.h,
                      text: "Next",
                      alignment: Alignment.bottomCenter,
                             onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const OnboardingTwoScreen(),
                    ),
                  );
                },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.v),
              CustomOutlinedButton(
                width: 212.h,
                text: "Skip",
                       onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>  SignupScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
