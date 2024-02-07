import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flora/change_notifiers/user_provider.dart';
import 'package:flora/controllers/signup.dart';
import 'package:flora/core/app_export.dart';
import 'package:flora/models/user.dart';
import 'package:flora/presentation/login_screen/login_screen.dart';
import 'package:flora/widgets/custom_elevated_button.dart';
import 'package:flora/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController userIDPromptController = TextEditingController();
var obscureText=true;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool passwordsMatch = true;
  bool registerationSuccessful = true;
  final _auth = FirebaseAuth.instance;
 void register() async {
  final String email = UserController.emailSignupController.text.trim();
  final String password = UserController.passwordSignupController.text.trim();

  // Show the loading indicator while registering
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
    final UserProvider userProvider = Provider.of<UserProvider>(context, listen: false); // Access the UserProvider instance
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final UserModel newUser = UserModel(
      uid: userCredential.user!.uid,
      username: UserController.usernameController.text.trim(),
      email: email,
    );

    // Store user information in Firestore
    await FirebaseFirestore.instance
        .collection("users")
        .doc(newUser.uid)
        .set(newUser.toJson());

    // Call fetchUsername to fetch the username after registration
    await userProvider.fetchUsername();

    // Registration successful, update the state or show a success message
    setState(() {
      registerationSuccessful = true;
    });

    // Close the loading indicator dialog
    Navigator.pop(context);

    // Show a success message and navigate to the HomeScreen
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registration Successful'),
          content: const Text('You have successfully registered. You may login now'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog.
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>  LoginScreen(), // Navigate to HomeScreen
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  } catch (error) {
    // Registration failed, log the error and set registrationSuccessful to false
    setState(() {
      registerationSuccessful = false;
    });

    // Close the loading indicator dialog
    Navigator.pop(context);

    // Show a failure message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Failed'),
          content: const Text('Registration failed. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

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
                  "Welcome !",
                  style: CustomTextStyles.titleSmallOnPrimaryMedium_2,
                ),
                SizedBox(height: 12.v),
                Text(
                  "Please provide the details below.",
                  style: CustomTextStyles.titleSmallOnPrimaryMedium,
                ),
                SizedBox(height: 37.v),
                _buildUserIDPrompt(context),
                SizedBox(height: 22.v),
                _buildEmail(context),
                SizedBox(height: 22.v),
                _buildPassword(context),
                SizedBox(height: 44.v),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "By pressing ‘Signup’ you agree to our ",
                        style: CustomTextStyles.titleSmallOnPrimaryMedium_1,
                      ),
                      TextSpan(
                        text: "Terms and Conditions",
                        style: CustomTextStyles.titleSmallOnPrimary,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 67.v),
                _buildSignupButton(context),
                SizedBox(height: 48.v),
               
                       Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                          style: CustomTextStyles.titleSmallOnPrimaryMedium_1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style:  CustomTextStyles.titleSmallOnPrimary,

                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 5.v),
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
              child:  Container(
                width: screenWidth * 0.2, // Width using screen percentage
                height: screenHeight * 0.12, // Height using screen percentage
                child: Image.asset('lib/images/logo.png'), // Replace with your logo image
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgEllipse2,
            height: 70.v,
            width: 120.h,
            alignment: Alignment.topLeft,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgEllipse1,
            height: 168.v,
            width: 76.h,
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(bottom: 13.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserIDPrompt(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.h,
        right: 16.h,
      ),
      child: CustomTextFormField(
        controller: UserController.usernameController,
        hintText: "Enter User ID",
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.h,
        right: 18.h,
      ),
      child: CustomTextFormField(
        controller: UserController.emailSignupController,
        hintText: "Enter Email",
        textInputType: TextInputType.emailAddress,
      ),
    );
  }

  /// Section Widget
 Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.h,
        right: 18.h,
      ),
      child: CustomTextFormField(
        controller: UserController.passwordSignupController,
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
    );
  }


  /// Section Widget
  Widget _buildSignupButton(BuildContext context) {
    return CustomElevatedButton(
       onPressed: () => register(),
      width: 212.h,
      text: "Signup",
    );
  }
}
