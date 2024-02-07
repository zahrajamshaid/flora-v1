import 'package:flora/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PerennialplantcomponentItemWidget extends StatelessWidget {
  const PerennialplantcomponentItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 154.v,
      width: 144.h,
      decoration: AppDecoration.outlineBlackF,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 18.h,
                vertical: 6.v,
              ),
              decoration: AppDecoration.fillErrorContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 55.v),
                  Text(
                    "Perennial Plant",
                    style: CustomTextStyles.bodyMediumOnPrimaryContainer_1,
                  ),
                  SizedBox(height: 9.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "4 mins ago",
                      style: CustomTextStyles.bodySmallOnPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgEllipse4,
            height: 92.v,
            width: 91.h,
            radius: BorderRadius.circular(
              46.h,
            ),
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
