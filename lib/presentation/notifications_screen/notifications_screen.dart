import 'package:flora/core/app_export.dart';
import 'package:flora/widgets/custom_elevated_button.dart';
import 'package:flora/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController dateEditTextController = TextEditingController();

  TextEditingController emailEditTextController = TextEditingController();

  TextEditingController dateEditTextController1 = TextEditingController();

  TextEditingController xyzJoinedCommunityValueEditTextController =
      TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 63.v,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 18.h),
                    child: Text(
                      "Notifications",
                      style: CustomTextStyles.titleMediumDosis,
                    ),
                  ),
                ),
                SizedBox(height: 63.v),
                _buildFrameFortySixRow(context),
                SizedBox(height: 7.v),
                _buildDateEditText(context),
                SizedBox(height: 7.v),
                _buildEmailEditText(context),
                SizedBox(height: 7.v),
                _buildFrameFortySixRow1(context),
                SizedBox(height: 7.v),
                _buildDateEditText1(context),
                SizedBox(height: 7.v),
                _buildXyzJoinedCommunityValueEditText(context),
                Spacer(),
                SizedBox(height: 58.v),
                Text(
                  "Clear All",
                  style: CustomTextStyles.bodyMediumOnPrimary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAcceptButton(BuildContext context) {
    return CustomElevatedButton(
      height: 27.v,
      width: 61.h,
      text: "Accept",
      margin: EdgeInsets.only(right: 10.h),
      buttonStyle: CustomButtonStyles.fillPrimaryTL13,
    );
  }

  /// Section Widget
  Widget _buildFrameFortySixRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.h, 24.v, 10.h, 23.v),
      decoration: AppDecoration.outlineOnPrimary1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 2.v,
              bottom: 6.v,
            ),
            child: Text(
              "@hunglee2 want to join your community",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          _buildAcceptButton(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDateEditText(BuildContext context) {
    return CustomTextFormField(
      controller: dateEditTextController,
      hintText: "New Features 🥳 update your app to enjoy. ",
      hintStyle: theme.textTheme.bodyMedium!,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 28.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return CustomTextFormField(
      controller: emailEditTextController,
      hintText: "Link your Email to your account.",
      hintStyle: theme.textTheme.bodyMedium!,
      textInputType: TextInputType.emailAddress,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 28.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildAllowButton(BuildContext context) {
    return CustomElevatedButton(
      height: 27.v,
      width: 61.h,
      text: "Allow",
      margin: EdgeInsets.only(
        left: 24.h,
        top: 5.v,
        bottom: 5.v,
      ),
      buttonStyle: CustomButtonStyles.fillPrimaryTL13,
    );
  }

  /// Section Widget
  Widget _buildFrameFortySixRow1(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6.h,
        vertical: 18.v,
      ),
      decoration: AppDecoration.outlineOnPrimary1,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 284.h,
              margin: EdgeInsets.only(top: 2.v),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Allow ",
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      text: "flora ",
                      style: CustomTextStyles.bodyMediumGreenGarden,
                    ),
                    TextSpan(
                      text:
                          "to send you email so that you are updated \nwith news.\n",
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: " ",
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          _buildAllowButton(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDateEditText1(BuildContext context) {
    return CustomTextFormField(
      controller: dateEditTextController1,
      hintText: "Your account has been logged in from new device.",
      hintStyle: theme.textTheme.bodyMedium!,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 28.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildXyzJoinedCommunityValueEditText(BuildContext context) {
    return CustomTextFormField(
      controller: xyzJoinedCommunityValueEditTextController,
      hintText: "@xyz has joined your community.",
      hintStyle: theme.textTheme.bodyMedium!,
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 28.v,
      ),
    );
  }
}
