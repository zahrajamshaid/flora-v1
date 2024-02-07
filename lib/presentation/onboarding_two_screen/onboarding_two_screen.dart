import 'package:flora/core/app_export.dart';
import 'package:flora/presentation/onboarding_three_screen/onboarding_three_screen.dart';
import 'package:flora/presentation/signup_screen/signup_screen.dart';
import 'package:flora/widgets/custom_elevated_button.dart';
import 'package:flora/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({Key? key})
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
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 22.v),
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.h,
                          vertical: 113.v,
                        ),
                        decoration:
                            AppDecoration.fillOnPrimaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderBL40,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Spacer(),
                            Text(
                              "How it works?",
                              style: CustomTextStyles.titleSmallOnPrimaryBold_1,
                            ),
                            SizedBox(height: 34.v),
                            SizedBox(
                              width: 379.h,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "To unlock the world of plant identification, follow these straightforward steps:\n",
                                      style: theme.textTheme.labelLarge,
                                    ),
                                    TextSpan(
                                      text: "\n",
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    TextSpan(
                                      text: "Step 1",
                                      style: theme.textTheme.labelLarge,
                                    ),
                                    TextSpan(
                                      text:
                                          ": Tap the camera icon to take a photo of a plant.\n\n",
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    TextSpan(
                                      text: "Step 2",
                                      style: theme.textTheme.labelLarge,
                                    ),
                                    TextSpan(
                                      text:
                                          ": Alternatively, select an image from your gallery that you'd like to identify.\n\n",
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    TextSpan(
                                      text:
                                          "Step 3: Let our cutting-edge image recognition technology do the rest!",
                                      style: theme.textTheme.labelLarge,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      width: 212.h,
                      text: "Let’s Get Started",
                      alignment: Alignment.bottomCenter,
                             onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const OnboardingThreeScreen(),
                    ),
                  );
                },
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgImage1RemovebgPreview423x430,
                      height: 423.v,
                      width: 430.h,
                      alignment: Alignment.topCenter,
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
                      builder: (context) => SignupScreen(),
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
