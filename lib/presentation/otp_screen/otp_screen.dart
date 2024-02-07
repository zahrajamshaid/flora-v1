import '../otp_screen/widgets/button_item_widget.dart';
import 'package:flora/core/app_export.dart';
import 'package:flora/widgets/app_bar/appbar_leading_image.dart';
import 'package:flora/widgets/app_bar/appbar_subtitle.dart';
import 'package:flora/widgets/app_bar/custom_app_bar.dart';
import 'package:flora/widgets/custom_elevated_button.dart';
import 'package:flora/widgets/custom_pin_code_text_field.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 1.v),
              CustomImageView(
                imagePath: ImageConstant.imgImage1,
                height: 200.adaptSize,
                width: 200.adaptSize,
              ),
              SizedBox(height: 19.v),
              Text(
                "We have sent OTP on your Email",
                style: CustomTextStyles.titleSmallOnPrimaryMedium_2,
              ),
              SizedBox(height: 29.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.h,
                  right: 25.h,
                ),
                child: CustomPinCodeTextField(
                  context: context,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 33.v),
              _buildEight(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 77.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowPrevSmallSvgrepoCom,
        margin: EdgeInsets.only(
          left: 47.h,
          top: 13.v,
          bottom: 13.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Enter Verification Code",
        margin: EdgeInsets.only(left: 6.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildEight(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 28.v,
      ),
      decoration: AppDecoration.green.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 77.v),
          Container(
            margin: EdgeInsets.only(left: 1.h),
            padding: EdgeInsets.symmetric(vertical: 1.v),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 4.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 123.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.h,
                        vertical: 1.v,
                      ),
                      decoration: AppDecoration.outlineBlueGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Text(
                        "1",
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(
                      height: 46.v,
                      width: 123.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 46.v,
                              width: 123.h,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.onPrimaryContainer
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(
                                  5.h,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: appTheme.blueGray400,
                                    spreadRadius: 2.h,
                                    blurRadius: 2.h,
                                    offset: Offset(
                                      0,
                                      1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 49.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "2",
                                      style: theme.textTheme.headlineSmall,
                                    ),
                                  ),
                                  Text(
                                    "ABC",
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.h),
                      decoration: AppDecoration.outlineBlueGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "3",
                            style: theme.textTheme.headlineSmall,
                          ),
                          SizedBox(height: 4.v),
                          Text(
                            "DEF",
                            style: theme.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.v),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 47.v,
                    crossAxisCount: 3,
                    mainAxisSpacing: 6.h,
                    crossAxisSpacing: 6.h,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ButtonItemWidget();
                  },
                ),
                SizedBox(height: 7.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 46.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomElevatedButton(
                          width: 123.h,
                          text: "0",
                          buttonStyle: CustomButtonStyles.outlineBlueGray,
                          buttonTextStyle: theme.textTheme.headlineSmall!,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgClose,
                          height: 17.v,
                          width: 23.h,
                          margin: EdgeInsets.only(
                            left: 58.h,
                            top: 13.v,
                            bottom: 15.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 83.v),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Didn’t receive OTP?",
                  style: CustomTextStyles.titleSmallOnPrimaryContainer,
                ),
                TextSpan(
                  text: " ",
                ),
                TextSpan(
                  text: "Resend OTP",
                  style: CustomTextStyles.titleSmallMedium_1,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
