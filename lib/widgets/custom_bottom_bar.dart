import 'package:flora/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHomeOnprimarycontainer,
      activeIcon: ImageConstant.imgHomeOnprimarycontainer,
      type: BottomBarEnum.Homeonprimarycontainer,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgScanner,
      activeIcon: ImageConstant.imgScanner,
      type: BottomBarEnum.Scanner,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCommunityErrorcontainer,
      activeIcon: ImageConstant.imgCommunityErrorcontainer,
      type: BottomBarEnum.Communityerrorcontainer,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgLock,
      activeIcon: ImageConstant.imgLock,
      type: BottomBarEnum.Lock,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        borderRadius: BorderRadius.circular(
          43.h,
        ),
        border: Border.all(
          color: theme.colorScheme.errorContainer.withOpacity(0.5),
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black9003f,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 40.adaptSize,
              width: 40.adaptSize,
              color: theme.colorScheme.errorContainer,
            ),
            activeIcon: Container(
              decoration: AppDecoration.fillTeal.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder26,
              ),
              child: CustomImageView(
                imagePath: bottomMenuList[index].activeIcon,
                height: 40.adaptSize,
                width: 40.adaptSize,
                color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                margin: EdgeInsets.symmetric(vertical: 8.v),
              ),
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Homeonprimarycontainer,
  Scanner,
  Communityerrorcontainer,
  Lock,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
