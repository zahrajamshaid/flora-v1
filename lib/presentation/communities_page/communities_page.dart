import 'package:flora/presentation/bottom_navbar.dart';
import 'package:flora/presentation/communities_one_screen/communities_one_screen.dart';

import '../communities_page/widgets/userprofile_item_widget.dart';
import 'package:flora/core/app_export.dart';
import 'package:flora/widgets/custom_elevated_button.dart';
import 'package:flora/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CommunitiesPage extends StatelessWidget {
  CommunitiesPage({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onSecondaryContainer.withOpacity(1),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.green,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 34.h,
              vertical: 19.v,
            ),
            child: Column(
              children: [
                SizedBox(height: 19.v),
                CustomSearchView(
                  controller: searchController,
                  hintText: "Search",
                ),
                SizedBox(height: 17.v),
                Text(
                  " what you have been looking for?",
                  style: CustomTextStyles.titleLargeSemiBold,
                ),
                SizedBox(height: 16.v),
                CustomElevatedButton(
                  height: 35.v,
                  width: 230.h,
                  text: "Create Your Community",
                  buttonStyle: CustomButtonStyles.fillPrimaryTL17,
                  onPressed: () {
                                        // Navigate to the desired screen here
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                 (CommunitiesOneScreen())),
                                        );
                                      },
                ),
                SizedBox(height: 15.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.h),
                    child: Text(
                      "My Communities",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
                SizedBox(height: 23.v),
                SizedBox(
                  height: 60.v,
                  width: 336.h,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 60.v,
                          width: 336.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 19.h,
                            vertical: 10.v,
                          ),
                          decoration:
                              AppDecoration.fillOnPrimaryContainer.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder20,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgEllipse22,
                            height: 39.adaptSize,
                            width: 39.adaptSize,
                            radius: BorderRadius.circular(
                              19.h,
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(70.h, 21.v, 29.h, 7.v),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.v),
                                child: Text(
                                  "Indoor Nature",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 17.v),
                                child: Text(
                                  "Dec 7, 2019 23:26",
                                  style: CustomTextStyles.bodySmallOnPrimary10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    right: 16.h,
                  ),
                  child: _buildRecentOrders(
                    context,
                    floraWorldText: "My plants",
                    decText: "Today 07:52",
                  ),
                ),
                SizedBox(height: 25.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    right: 16.h,
                  ),
                  child: _buildRecentOrders(
                    context,
                    floraWorldText: "Flora World",
                    decText: "Dec 30, 2019 07:52",
                  ),
                ),
                SizedBox(height: 26.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.h),
                    child: Text(
                      "Explore",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
                SizedBox(height: 37.v),
                _buildUserProfile(context),
                SizedBox(height: 24.v),
                Text(
                  "Explore More",
                  style: CustomTextStyles.titleSmallOnPrimaryContainer_1,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),

    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return SizedBox(
      height: 168.v,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 6.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 1.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return UserprofileItemWidget();
        },
      ),
    );
  }

  /// Common widget
  Widget _buildRecentOrders(
    BuildContext context, {
    required String floraWorldText,
    required String decText,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse24,
            height: 39.adaptSize,
            width: 39.adaptSize,
            radius: BorderRadius.circular(
              19.h,
            ),
            margin: EdgeInsets.only(
              top: 3.v,
              bottom: 2.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 13.v,
              bottom: 12.v,
            ),
            child: Text(
              floraWorldText,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onPrimary.withOpacity(1),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 31.v,
              right: 6.h,
            ),
            child: Text(
              decText,
              style: CustomTextStyles.bodySmallOnPrimary10.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
