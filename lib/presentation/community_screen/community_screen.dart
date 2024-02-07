import 'package:flora/core/app_export.dart';
import 'package:flora/presentation/bottom_navbar.dart';
import 'package:flora/widgets/custom_icon_button.dart';
import 'package:flora/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CommunityScreen extends StatelessWidget {
  CommunityScreen({Key? key}) : super(key: key);

  TextEditingController saveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: 432.h,
                padding: EdgeInsets.symmetric(vertical: 28.v),
                child: Column(children: [
                  _buildRowWithArrowAndLeave(context),
                  SizedBox(height: 30.v),
                  Divider(color: appTheme.blueGray7007f),
                  Spacer(),
                  Text("Dec 7, 2019",
                      style: CustomTextStyles.bodySmallOnPrimary10),
                  SizedBox(height: 34.v),
                  Padding(
                      padding: EdgeInsets.only(left: 24.h, right: 144.h),
                      child: _buildColumnWithHungleeTwoAndExcepteursintoccaeca(
                          context,
                          dynamicText1: "@hunglee2",
                          dynamicText2:
                              "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, to",
                          dynamicText3: "11:49 pm")),
                  SizedBox(height: 18.v),
                  Padding(
                      padding: EdgeInsets.only(left: 144.h, right: 24.h),
                      child: _buildColumnWithHungleeTwoAndExcepteursintoccaeca(
                          context,
                          dynamicText1: "@hunglee2",
                          dynamicText2:
                              "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id es",
                          dynamicText3: "03:48 am")),
                  SizedBox(height: 13.v)
                ])),
          bottomNavigationBar:  BottomBar(),));
  }

  /// Section Widget
  Widget _buildRowWithArrowAndLeave(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 31.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomImageView(
                    imagePath: ImageConstant.imgArrowLeft,
                    height: 25.adaptSize,
                    width: 25.adaptSize,
                    margin: EdgeInsets.only(top: 18.v, bottom: 10.v),
                    onTap: () {
                      onTapImgArrowLeft(context);
                    }),
                CustomImageView(
                    imagePath: ImageConstant.imgEllipse20,
                    height: 53.adaptSize,
                    width: 53.adaptSize,
                    radius: BorderRadius.circular(26.h),
                    margin: EdgeInsets.only(left: 23.h)),
                Padding(
                    padding:
                        EdgeInsets.only(left: 13.h, top: 12.v, bottom: 1.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Flora Enthusiasts",
                              style: theme.textTheme.bodyMedium),
                          SizedBox(height: 4.v),
                          Text("5.9k Members",
                              style: CustomTextStyles.bodySmallOnErrorContainer)
                        ]))
              ]),
          Padding(
              padding: EdgeInsets.only(top: 18.v, bottom: 16.v),
              child: Text("Leave", style: CustomTextStyles.bodyMediumOnPrimary))
        ]));
  }

  /// Section Widget
  Widget _buildSeventy(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 60.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5.v),
              child: CustomIconButton(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  padding: EdgeInsets.all(11.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgAddEllipseSvgrepoCom))),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: CustomTextFormField(
                      controller: saveController,
                      hintText: "Type  ",
                      textInputAction: TextInputAction.done,
                      suffix: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 10.v, 15.h, 10.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgSave,
                              height: 27.v,
                              width: 30.h)),
                      suffixConstraints: BoxConstraints(maxHeight: 50.v),
                      contentPadding: EdgeInsets.only(
                          left: 10.h, top: 16.v, bottom: 16.v))))
        ]));
  }

  /// Common widget
  Widget _buildColumnWithHungleeTwoAndExcepteursintoccaeca(
    BuildContext context, {
    required String dynamicText1,
    required String dynamicText2,
    required String dynamicText3,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
        decoration: AppDecoration.outlineBlueGrayF
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2.v),
              Text(dynamicText1,
                  style: CustomTextStyles.labelMediumDosisOnPrimary.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(0.8))),
              SizedBox(height: 1.v),
              SizedBox(
                  width: 237.h,
                  child: Text(dynamicText2,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodySmallOnPrimary_1.copyWith(
                          color:
                              theme.colorScheme.onPrimary.withOpacity(0.6)))),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: EdgeInsets.only(right: 10.h),
                      child: Text(dynamicText3,
                          style: CustomTextStyles.bodySmallOnPrimary10
                              .copyWith(color: theme.colorScheme.onPrimary))))
            ]));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
