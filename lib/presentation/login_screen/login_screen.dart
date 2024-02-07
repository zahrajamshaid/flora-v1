import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flora/change_notifiers/user_provider.dart';
import 'package:flora/controllers/login.dart';
import 'package:flora/controllers/signup.dart';
import 'package:flora/core/app_export.dart';
import 'package:flora/presentation/dashboard_container_screen/dashboard_container_screen.dart';
import 'package:flora/presentation/dashboard_page/dashboard_page.dart';
import 'package:flora/presentation/signup_screen/signup_screen.dart';
import 'package:flora/widgets/custom_elevated_button.dart';
import 'package:flora/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  var obscureText = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                _buildStackContainer(context),
                SizedBox(height: 42.v),
                Text(
                  "Welcome Back!",
                  style: CustomTextStyles.titleSmallOnPrimaryMedium_2,
                ),
                SizedBox(height: 12.v),
                Text(
                  "Please provide your credentials to login to the app.",
                  style: CustomTextStyles.titleSmallOnPrimaryMedium,
                ),
                SizedBox(height: 68.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: CustomTextFormField(
                    controller: emailLoginController,
                    hintText: "Enter Email/ User ID",
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 22.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 14.h,
                    right: 18.h,
                  ),
                  child: CustomTextFormField(
                    controller: passwordLoginController,
                    hintText: "Enter Password",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    suffix: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 7.v, 25.h, 7.v),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: CustomImageView(
                          imagePath: ImageConstant.imgLayer2,
                          height: 40.adaptSize,
                          width: 40.adaptSize,
                        ),
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      maxHeight: 55.v,
                    ),
                    obscureText: obscureText,
                    contentPadding: EdgeInsets.only(
                      left: 10.h,
                      top: 18.v,
                      bottom: 18.v,
                    ),
                  ),
                ),
                SizedBox(height: 30.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 18.h),
                    child: Text(
                      " Forgot Password?",
                      style: CustomTextStyles.titleSmallOnPrimaryMedium_2,
                    ),
                  ),
                ),
                Spacer(),
                CustomElevatedButton(
                  width: 212.h,
                  text: "Login",
                  onPressed: () async {
                       
                 try {
                      // Step 1: Authenticate the user with Firebase Authentication
                      await _auth.signInWithEmailAndPassword(
                        email: emailLoginController.text.trim(),
                        password: passwordLoginController.text.trim(),
                      );

                      // Step 2: Check if the user's email and password exist in Firestore
                      final CollectionReference usersCollection =
                          FirebaseFirestore.instance.collection('users');
                      final QuerySnapshot querySnapshot = await usersCollection
                          .where('email', isEqualTo: emailLoginController.text.trim())
                          .get();

                      // Step 3: If a document with matching email is found, consider it a successful login
                      if (querySnapshot.docs.isNotEmpty) {
                        final userProvider = Provider.of<UserProvider>(context, listen: false);
                        userProvider.fetchUsername();
                        
                        // Navigate to the home screen after successful login
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardPage(),
                          ),
                        );
                      } else {
                        // If no matching document is found, handle login failure
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Login Error'),
                              content: Text('There was an error during login. Please try again.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } catch (error) {
                      // Handle login errors and show a dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Login Error'),
                            content: Text('There was an error during login. Please try again.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } }),
            
                SizedBox(height: 47.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?  ",
                      style: CustomTextStyles.titleSmallOnPrimaryMedium_1,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Signup",
                        style: CustomTextStyles.titleSmallOnPrimary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackContainer(BuildContext context) {
      final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 291.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 107.h,
                vertical: 93.v,
              ),
              decoration: AppDecoration.green.copyWith(
                borderRadius: BorderRadiusStyle.customBorderBL40,
              ),
              width: double.infinity,
              child: Container(
                width: screenWidth * 0.2, // Width using screen percentage
                height: screenHeight * 0.12, // Height using screen percentage
                child: Image.asset('lib/images/logo.png'), // Replace with your logo image
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgEllipse270x120,
            height: 70.v,
            width: 120.h,
            alignment: Alignment.topLeft,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgEllipse1168x76,
            height: 168.v,
            width: 76.h,
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(bottom: 13.v),
          ),
        ],
      ),
    );
  }
}
