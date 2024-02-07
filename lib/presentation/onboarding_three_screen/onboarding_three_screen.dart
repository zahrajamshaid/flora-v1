import 'package:flora/core/app_export.dart';
import 'package:flora/presentation/signup_screen/signup_screen.dart';
import 'package:flora/widgets/custom_elevated_button.dart';
import 'package:flora/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class OnboardingThreeScreen extends StatelessWidget {
  const OnboardingThreeScreen({Key? key})
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
                          horizontal: 93.h,
                          vertical: 148.v,
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
                              "Congratulation!",
                              style: CustomTextStyles.titleSmallOnPrimaryBold_1,
                            ),
                            SizedBox(height: 27.v),
                            SizedBox(
                              width: 241.h,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          " You're now equipped with the tools and knowledge to explore the world of plants with ",
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    TextSpan(
                                      text:
                                          "flora.",
                                      style:
                                          CustomTextStyles.bodySmallGreenGarden,
                                    ),
                                     TextSpan(
                                      text:
                                          " Start your botanical journey by tapping \"Get Started\"  begin identifying and learning about the incredible flora around you.",
                                        style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
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
                      builder: (context) => SignupScreen(),
                    ),
                  );
                },
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgImage1RemovebgPreview,
                      height: 288.v,
                      width: 430.h,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 69.v),
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
