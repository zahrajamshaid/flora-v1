import 'package:flora/core/app_export.dart';
import 'package:flora/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:flora/widgets/app_bar/appbar_title.dart';
import 'package:flora/widgets/app_bar/custom_app_bar.dart';
import 'package:flora/widgets/custom_elevated_button.dart';
import 'package:flora/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CommunitiesOneScreen extends StatelessWidget {
  CommunitiesOneScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameController = TextEditingController();

  TextEditingController enterPurposeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 9.v,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 116.adaptSize,
                  width: 116.adaptSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgEllipse21116x116,
                        height: 116.adaptSize,
                        width: 116.adaptSize,
                        radius: BorderRadius.circular(
                          58.h,
                        ),
                        alignment: Alignment.center,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgCameraSvgrepoCom,
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 86.v),
                CustomTextFormField(
                  controller: nameController,
                  hintText: "Community Name",
                ),
                SizedBox(height: 33.v),
                CustomTextFormField(
                  controller: enterPurposeController,
                  hintText: "Enter your purpose in 2 to 3 lines ",
                  textInputAction: TextInputAction.done,
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 155.h),
                    child: Text(
                      "Important",
                      style: CustomTextStyles.bodyLargeOnPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 12.v),
                Container(
                  width: 337.h,
                  margin: EdgeInsets.only(
                    left: 31.h,
                    right: 30.h,
                  ),
                  decoration: AppDecoration.outlineGray,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Be careful with the content you post. In case of violation of our community guidelines , we have to disable your community. We are open to feedbacks. \n",
                          style: CustomTextStyles.bodyMediumOnPrimary13,
                        ),
                        TextSpan(
                          text: "Thankyou",
                          style: CustomTextStyles.bodyMediumOnPrimary_1,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 76.v),
                CustomElevatedButton(
                  width: 212.h,
                  text: "Create",
                ),
                SizedBox(height: 89.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "Your Community",
        margin: EdgeInsets.only(left: 44.h),
      ),
      actions: [
        AppbarSubtitleOne(
          text: "Skip",
          margin: EdgeInsets.fromLTRB(59.h, 17.v, 59.h, 22.v),
        ),
      ],
    );
  }
}
