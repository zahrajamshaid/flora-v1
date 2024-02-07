import 'dart:async';

import 'package:flora/change_notifiers/user_provider.dart';
import 'package:flora/models/plantoftheday.dart';
import 'package:flora/models/weather_data.dart';
import 'package:flora/presentation/bottom_navbar.dart';
import 'package:flora/presentation/side_navigation_screen/side_navigation_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../dashboard_page/widgets/perennialplantcomponent_item_widget.dart';
import 'package:flora/core/app_export.dart';
import 'package:flora/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// ignore_for_file: must_be_immutable
class DashboardPage extends StatefulWidget {
  
  const DashboardPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin  {
  late int plantIndex; // Index for the current date
  late Plant currentPlant;

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  
    // The rest of your initState logic...

    // Initialize the index based on the current date
    plantIndex = DateTime.now().day % plantList.length;
    currentPlant = plantList[plantIndex];

    // Fetch the plant of the day initially
    // fetchPlantOfTheDay();

    // Schedule daily updates
    Timer.periodic(const Duration(days: 1), (Timer t) {
      // Update the index and current plant
      setState(() {
        plantIndex = DateTime.now().day % plantList.length;
        currentPlant = plantList[plantIndex];
      });
      // fetchPlantOfTheDay();
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
               bottomNavigationBar:  BottomBar(),
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              WeatherInfo(),
              SizedBox(height: 35.v),
              _buildRecentlyScanned(context),
              SizedBox(height: 17.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "Recently Scanned",
                    style: CustomTextStyles.titleMediumDosis,
                  ),
                ),
              ),
              SizedBox(height: 13.v),
              _buildPerennialPlantComponent(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget

  /// Section Widget
  Widget _buildRecentlyScanned(BuildContext context) {
      final currentTime = DateTime.now();


  
   
    DateTime now = DateTime.now();
    String formattedDate = "${now.year}/${now.month}/${now.day}";

    return SizedBox(
      height: 176.v,
      width: 394.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 150.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Plant of the Day",
                    style: CustomTextStyles.titleLargeOnPrimary,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.v),
                    child: Text(
                        formattedDate,
                      style: CustomTextStyles.bodySmallOnPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 157.v,
              width: 202.h,
              decoration: AppDecoration.outlineBlackF,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.h,
                        vertical: 8.v,
                      ),
                      decoration: AppDecoration.fillErrorContainer.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 7.v),
                          CustomIconButton(
                            height: 19.adaptSize,
                            width: 19.adaptSize,
                            padding: EdgeInsets.all(3.h),
                            alignment: Alignment.centerRight,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgFavorite,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 33.v),
                          Padding(
                            padding: EdgeInsets.only(left: 6.h),
                            child: Text(
                                "Stinking corpse lily",
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(height: 1.v),
                          Padding(
                            padding: EdgeInsets.only(left: 6.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 3.v),
                                  child: Text(
                                   "Rafflesia arnoldii",
                                    style: CustomTextStyles
                                        .bodyMediumOnPrimaryContainer,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 14.v),
                                  child: Text(
                                    "Tap to learn more",
                                    style: CustomTextStyles
                                        .dosisOnPrimaryContainer
                                        .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath:   ImageConstant.imgImage2,
                    height: 81.adaptSize,
                    width: 81.adaptSize,
                    radius: BorderRadius.circular(
                      40.h,
                    ),
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 57.h),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPerennialPlantComponent(BuildContext context) {
    return SizedBox(
      height: 154.v,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 41.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 60.h,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return PerennialplantcomponentItemWidget();
        },
      ),
    );
  }
}

    class WeatherInfo extends StatefulWidget {
 
  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  final String apiKey = '4c76edb6dd3449f8c69aa0e350a0c32e'; // Replace with your OpenWeatherMap API key

  WeatherData? weatherData;
  String locationName = 'Fetching location...';

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    try {
      Position position = await _determinePosition();

      const String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
      final Uri uri = Uri.parse(apiUrl).replace(queryParameters: {
        'lat': position.latitude.toString(),
        'lon': position.longitude.toString(),
        'appid': apiKey,
      });

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        WeatherData fetchedWeatherData = WeatherData.fromJson(data);
        setState(() {
          weatherData = fetchedWeatherData;
        });
      } else {
        throw 'Failed to fetch weather data. Status Code: ${response.statusCode}';
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        locationName = 'Error: $e';
      });
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = (await Geolocator.requestPermission()) as bool;
      if (!serviceEnabled) {
        throw 'Location services are disabled.';
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied.';
      }
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  @override
  Widget build(BuildContext context) {
       final currentTime = DateTime.now();
    String greeting = '';

    if (currentTime.hour < 12) {
      greeting = 'Good Morning';
    } else if (currentTime.hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

   
    DateTime now = DateTime.now();
    String formattedDate = "${now.year}/${now.month}/${now.day}";
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 38.v,
      ),
      decoration: AppDecoration.green,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 7.h,
              right: 3.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  SideNavigationScreen(),
                            ),
                          );
                        },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgTelevision,
                    height: 22.v,
                    width: 30.h,
                    margin: EdgeInsets.only(top: 19.v),
                      color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 21.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        greeting,
                        style: CustomTextStyles.bodySmallOnPrimaryContainer,
                      ),
                      SizedBox(height: 3.v),
                         Text(
// context.watch<UserProvider>().username ?? 
 "Zahra",
   style: CustomTextStyles.titleLargeSemiBold,
),
                    
                    ],
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgNotificationBellSvgrepoCom,
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  margin: EdgeInsets.only(top: 13.v),
                    color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 50.v),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            child: Container(
              height: 154.v,
              width: 397.h,
              padding: EdgeInsets.symmetric(
                horizontal: 31.h,
                vertical: 22.v,
              ),
              decoration: AppDecoration.shadow.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 12.v,
                        right: 20.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.v),
                            child: Text(
                              "Humidity",
                              style: CustomTextStyles.bodySmallOnPrimary_2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 49.h),
                            child: Text(
                                  weatherData?.humidity ?? "60%",
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 97.v,
                      width: 334.h,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(left: 6.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 1.v),
                                          child: Text(
                                            "Wind Speed",
                                            style: CustomTextStyles
                                                .bodySmallOnPrimary_2,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 46.h),
                                          child: Text(
                                           weatherData?.windSpeed ?? '20m/h',
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12.v),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          weatherData?.condition ?? "Partly Cloudy",
                                          style: CustomTextStyles
                                              .bodyLargeOnPrimaryRegular,
                                        ),
                                        Spacer(
                                          flex: 67,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 3.v,
                                            bottom: 2.v,
                                          ),
                                          child: Text(
                                            "Visibility",
                                            style: CustomTextStyles
                                                .bodySmallOnPrimary_2,
                                          ),
                                        ),
                                        Spacer(
                                          flex: 15,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 2.v),
                                          child: Text(
                                              weatherData?.visibility ?? "30 Km",
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                               weatherData?.temperature ?? "23°C ",
                              style: theme.textTheme.displayLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 7.v),
        ],
      ),
    );
  }
}