import 'package:flora/core/app_export.dart';
import 'package:flora/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  const UserprofileItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      width: 164.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 14.v),
          CustomImageView(
            imagePath: ImageConstant.imgEllipse20,
            height: 53.adaptSize,
            width: 53.adaptSize,
            radius: BorderRadius.circular(
              26.h,
            ),
            margin: EdgeInsets.only(left: 8.h),
          ),
          SizedBox(height: 18.v),
          Container(
            height: 18.v,
            width: 91.h,
            margin: EdgeInsets.only(left: 12.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Flora Enthusiasts",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Flora Enthusiasts",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 17.v),
          CustomElevatedButton(
            height: 27.v,
            width: 61.h,
            text: "Join",
            buttonStyle: CustomButtonStyles.fillPrimaryTL13,
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }
}
