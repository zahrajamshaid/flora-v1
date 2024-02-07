import 'package:flora/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonItemWidget extends StatelessWidget {
  const ButtonItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.h),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "4",
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 4.v),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "GHI",
              style: theme.textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
