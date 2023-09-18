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

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  static const _initialCountryCode = 'PK';
  var _country =
      countries.firstWhere((element) => element.code == _initialCountryCode);

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
    phoneFocusNode.dispose();
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
                    text: "Forgot Password?",
                    fontSize: 26,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text:
                        "Don't worry. Just fill your phone number. We'll send you and OTP to reset your password",
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
                                  isFormValid = true;
                                });
                              } else {
                                setState(() {
                                  isFormValid = false;
                                });
                              }
                            },
                            onCountryChanged: (country) => _country = country,
                            // onSubmitted: (value) {
                            //   Utils.fieldFocusChange(
                            //       context, phoneFocusNode, passwordFocusNode);
                            // },
                          )),
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  CustomButton(
                    text: "Get OTP",
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
