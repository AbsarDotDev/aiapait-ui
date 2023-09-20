import 'dart:async';

import 'package:aiapait/utils/colors.dart';
import 'package:aiapait/utils/regex_checker.dart';
import 'package:aiapait/utils/route_names.dart';
import 'package:aiapait/utils/utils.dart';
import 'package:aiapait/widgets/custom_button.dart';
import 'package:aiapait/widgets/custom_text.dart';
import 'package:aiapait/widgets/custom_textfield.dart';
import 'package:aiapait/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier(true);
  static const _initialCountryCode = 'PK';
  var _country =
      countries.firstWhere((element) => element.code == _initialCountryCode);
  bool isLoading = false;
  bool isFormValid = false;
  bool isPhoneNumberValid = false;
  bool isPasswordValid = false;
  void validateForm() {
    setState(() {
      isFormValid = isPhoneNumberValid && isPasswordValid;
    });
  }

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
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
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
                    text: "Let's Sign You In",
                    fontSize: 26,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: "Welcome Back",
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
                      Card(
                          elevation: 20.0,
                          shadowColor: Colors.grey[50],
                          child: IntlPhoneField(
                            focusNode: phoneFocusNode,
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
                            initialCountryCode: _initialCountryCode,
                            onChanged: (value) {
                              if (value.number.length >= _country.minLength &&
                                  value.number.length <= _country.maxLength) {
                                setState(() {
                                  isPhoneNumberValid = true;
                                });
                              } else {
                                setState(() {
                                  isPhoneNumberValid = false;
                                });
                              }
                              validateForm();
                            },
                            onCountryChanged: (country) => _country = country,
                            onSubmitted: (value) {
                              Utils.fieldFocusChange(
                                  context, phoneFocusNode, passwordFocusNode);
                            },
                          )),
                      ValueListenableBuilder(
                          valueListenable: _obsecurePassword,
                          builder: (context, value, child) {
                            return CustomTextField(
                              currentNode: passwordFocusNode,
                              obscureText: _obsecurePassword.value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    isFormValid = false;
                                  });
                                  return 'This is a required field';
                                } else if (!value.isValidPassword) {
                                  setState(() {
                                    isFormValid = false;
                                  });
                                  return 'Your password should be between 8 and 50 characters';
                                }
                                // Add more validation logic as needed
                                setState(() {
                                  isPasswordValid = true;
                                });
                                validateForm();

                                return null;
                              },
                              suffixIcon: const Icon(Icons.remove_red_eye),
                              preFixIcon: Icons.lock,
                              controller: passwordController,
                              hintText: 'Password',
                            );
                          }),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteNames.forgotpasswordScreen);
                        },
                        text: "Forgot Password?",
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                        isLink: true,
                      ),
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  CustomButton(
                    text: "Login",
                    isDisabled: !isFormValid,
                    isLoading: isLoading,
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      Timer(const Duration(seconds: 2), () {
                        Navigator.pushNamed(context, RouteNames.homeScreen);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "New here?",
                        fontSize: 15,
                        color: AppColors.primary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.signupScreen);
                        },
                        text: "Register Now",
                        fontSize: 14,
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
