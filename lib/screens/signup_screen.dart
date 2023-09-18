import 'dart:async';

import 'package:aiapait/utils/colors.dart';
import 'package:aiapait/utils/regex_checker.dart';
import 'package:aiapait/utils/route_names.dart';
import 'package:aiapait/widgets/custom_button.dart';
import 'package:aiapait/widgets/custom_text.dart';
import 'package:aiapait/widgets/custom_textfield.dart';
import 'package:aiapait/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  bool isFormValid = false;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Color(AppColors.bgColor),
        backgroundColor: Color(AppColors.bgColor),
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(
              image: AssetImage('assets/logo.png'),
              height: 50,
            ),
            CustomText(
              text: "TRADEMARK REGISTERATION",
              fontSize: 20,
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
              fonFamily: 'Raleway',
            ),
          ],
        ),
      ),
      backgroundColor: Color(AppColors.bgColor),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.values[2],
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomText(
                    text: "Create Your Account",
                    fontSize: 26,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: "Let's get Started",
                    fontSize: 15,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            setState(() {
                              isFormValid = false;
                            });
                            return 'This is a required field';
                          } else if (value.length < 2 || value.length > 50) {
                            setState(() {
                              isFormValid = false;
                            });
                            return 'Enter betweeen 2 to 50 characters';
                          }
                          // Add more validation logic as needed

                          return null;
                        },
                        preFixIcon: Icons.person_outline,
                        controller: fullNameController,
                        hintText: 'Full Name',
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            setState(() {
                              isFormValid = false;
                            });
                            return 'This is a required field';
                          } else if (!value.isValidEmail) {
                            setState(() {
                              isFormValid = false;
                            });
                            return 'Invalid email address';
                          }
                          // Add more validation logic as needed

                          return null;
                        },
                        preFixIcon: Icons.email_outlined,
                        controller: emailController,
                        hintText: 'Email',
                      ),
                      Card(
                          elevation: 20.0,
                          shadowColor: Colors.grey[50],
                          child: IntlPhoneField(
                            dropdownIconPosition: IconPosition.trailing,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Color(AppColors
                                          .primary), // Change the border color when focused
                                      width: 2,
                                    ))),
                            initialCountryCode: 'PK',
                            validator: (value) {
                              if (value!.completeNumber.isEmpty ||
                                  value.completeNumber.isValidPhone) {
                                return 'Invalid Phone Number';
                              }
                              return null;
                            },
                            onChanged: (phone) {
                              setState(() {
                                isFormValid = phone.completeNumber.isNotEmpty &&
                                    passwordController.text.isNotEmpty;
                              });
                            },
                          )),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty || value.isValidPassword) {
                            setState(() {
                              isFormValid =
                                  passwordController.text.isNotEmpty &&
                                      value.isNotEmpty;
                            });
                            return 'This is a required field';
                          }
                          // Add more validation logic as needed

                          return null;
                        },
                        suffixIcon: Icons.remove_red_eye,
                        preFixIcon: Icons.lock,
                        controller: passwordController,
                        hintText: 'Password',
                      ),
                      CustomText(
                        color: AppColors.primary,
                        text: "Forgot Password?",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  CustomButton(
                    text: "Register Now",
                    isDisabled: !isFormValid,
                    isLoading: isLoading,
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                        Timer(const Duration(seconds: 2), () {
                          isLoading = false;
                        });
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Already have account?",
                        fontSize: 15,
                        color: AppColors.primary,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.loginScreen);
                        },
                        text: "Login",
                        fontSize: 15,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        isLink: true,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
