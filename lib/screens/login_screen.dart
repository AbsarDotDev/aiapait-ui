import 'package:aiapait/utils/colors.dart';
import 'package:aiapait/widgets/custom_button.dart';
import 'package:aiapait/widgets/custom_text.dart';
import 'package:aiapait/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.bgColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                const SizedBox(
                  height: 10,
                ),
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
                Flexible(
                  fit: FlexFit.loose,
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
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
                                      width: 3.0,
                                    ))),
                            initialCountryCode: 'PK',
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                          )),
                      CustomTextField(
                        suffixIcon: Icons.remove_red_eye,
                        preFixIcon: Icons.lock,
                        controller: phoneController,
                        hintText: 'Phone Number',
                      ),
                      CustomText(
                        color: AppColors.primary,
                        text: "Forgot Password?",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                CustomButton(
                  buttonText: "Login",
                  isLoading: isLoading,
                  isValid: true,
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "New here?",
                      fontSize: 15,
                      color: AppColors.primary,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomText(
                      text: "Register Now",
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
        ),
      ),
    );
  }
}
