import 'dart:io';

import 'package:flora/change_notifiers/user_provider.dart';
import 'package:flora/presentation/bottom_navbar.dart';
import 'package:flora/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:flora/presentation/scanning_screen/scanning_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
// Assuming you have Firebase initialized and a user is signed in
  File? _profilePhoto;

  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profilePhoto = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: screenHeight * 0.08),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Adjust the height as needed

                        Center(
                          child: GestureDetector(
                            onTap: _getImage,
                            child: _profilePhoto != null
                                ? CircleAvatar(
                                    radius: screenHeight * 0.09,
                                    backgroundImage: FileImage(_profilePhoto!),
                                    child: SvgPicture.asset(
                                      'lib/assets/camera.svg', // Replace with your SVG asset
                                      color: Colors.white,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: screenHeight * 0.09,
                                    backgroundColor: Colors.white,
                                    child: SvgPicture.asset(
                                      'lib/assets/camera.svg', // Replace with your SVG asset
                                      color: Colors.black,
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                          width: screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(screenHeight * 0.07),
                              topRight: Radius.circular(screenHeight * 0.07),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      context.watch<UserProvider>().username,
                                      style: const TextStyle(
                                        color: Color(0xFF2C2015),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        fontFamily: 'Dosis',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigate to the desired screen here
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                 EditProfileScreen()),
                                        );
                                      },
                                      child: SvgPicture.asset(
                                        'lib/assets/edit.svg', // Replace with your SVG asset
                                        width:
                                            24, // Set the width and height as needed
                                        height: 24,
                                        // color: const Color(
                                        //     0xFF2C2015), // Set the color to match your text color
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const CustomRowWidget(
                                  svgPath:
                                      'lib/assets/passwords.svg', // Replace with your SVG asset path
                                  text: 'Change Password',
                                  showToggleButton: false,
                                ),
                                CustomRowWidget(
                                  svgPath:
                                      'lib/assets/idea.svg', // Replace with your SVG asset path
                                  text: 'Theme',
                                  onChanged: (bool isToggled) {
                                    // Implement your logic when the toggle button is pressed here

                                    // You can update state or perform any other action based on the toggle state.
                                  },
                                  showToggleButton: true,
                                ),
                                CustomRowWidget(
                                  svgPath:
                                      'lib/assets/notification.svg', // Replace with your SVG asset path
                                  text: 'Nottifications',
                                  onChanged: (bool isToggled) {
                                    // Implement your logic when the toggle button is pressed here

                                    // You can update state or perform any other action based on the toggle state.
                                  },
                                  showToggleButton: true,
                                ),
                              ]),
                            ),
                          )))
                ])),
    bottomNavigationBar:  BottomBar(),
      );
    });
  }
 
}


class CustomRowWidget extends StatefulWidget {
  final String text;
  final ValueSetter<bool>? onChanged; // Make onChanged optional
  final String? svgPath;
  final bool showToggleButton; // Make the toggle button optional

  const CustomRowWidget({
    required this.text,
    this.onChanged, // Make onChanged optional
    this.svgPath,
    this.showToggleButton = false, // Provide a default value of true
  });

  @override
  _CustomRowWidgetState createState() => _CustomRowWidgetState();
}

class _CustomRowWidgetState extends State<CustomRowWidget> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth;

        return Container(
          width: containerWidth,
          height: 66,
          padding: const EdgeInsets.symmetric(horizontal: 33),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.25, color: Color(0xFF2C2015))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (widget.svgPath != null)
                SvgPicture.asset(widget.svgPath!, width: 28, height: 28),
              if (widget.svgPath != null) const SizedBox(width: 10),
              Text(
                widget.text,
                style: const TextStyle(
                  color: Color(0xFF2C2015),
                  fontFamily: 'Dosis',
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              if (widget.showToggleButton && widget.onChanged != null)
                Switch(
                  value: isToggled,
                  onChanged: (value) {
                    setState(() {
                      isToggled = value;
                    });
                    widget.onChanged!(isToggled); // Invoke onChanged if it's not null
                  },
                  activeTrackColor: Colors.green,
                  activeColor: Colors.white,
                ),
            ],
          ),
        );
      },
    );
  }
}
