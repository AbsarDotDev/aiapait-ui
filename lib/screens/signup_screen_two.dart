import 'package:aiapait/cubit/signup_cubit.dart';
import 'package:aiapait/utils/colors.dart';
import 'package:aiapait/utils/route_names.dart';

import 'package:aiapait/widgets/custom_button.dart';
import 'package:aiapait/widgets/custom_text.dart';
import 'package:aiapait/widgets/custom_textfield.dart';
import 'package:aiapait/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreenTwo extends StatefulWidget {
  const SignUpScreenTwo({super.key});

  @override
  State<SignUpScreenTwo> createState() => _SignUpScreenTwoState();
}

class _SignUpScreenTwoState extends State<SignUpScreenTwo> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  FocusNode nameFocusNode = FocusNode();

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
      body: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          final SignupCubit signupCubit = context.read<SignupCubit>();

          return state.when(
              main: (nameState, emailState, passwordState,
                      isPasswordObscured) =>
                  CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
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
                                    isValid: nameState.isValid,
                                    errorMessage: nameState.error,
                                    onChanged: (name) {
                                      signupCubit.onNameChanged(name);
                                    },
                                    currentNode: nameFocusNode,
                                    nextNode: emailFocusNode,
                                    preFixIcon: Icons.person,
                                    controller: nameController,
                                    hintText: 'Name',
                                  ),
                                  CustomTextField(
                                    isValid: emailState.isValid,
                                    errorMessage: emailState.error,
                                    onChanged: (email) {
                                      signupCubit.onEmailChanged(email);
                                    },
                                    currentNode: emailFocusNode,
                                    nextNode: passwordFocusNode,
                                    preFixIcon: Icons.mail,
                                    controller: emailController,
                                    hintText: 'Email',
                                  ),
                                  CustomTextField(
                                    isValid: passwordState.isValid,
                                    errorMessage: passwordState.error,
                                    onChanged: (password) {
                                      signupCubit.onPasswordChanged(password);
                                    },
                                    currentNode: passwordFocusNode,
                                    obscureText: isPasswordObscured,
                                    suffixIcon: isPasswordObscured
                                        ? const Icon(Icons.visibility)
                                        : const Icon(
                                            Icons.visibility_off_sharp),
                                    suffixOnTap: () {
                                      signupCubit.onTogglePassword();
                                    },
                                    preFixIcon: Icons.lock,
                                    controller: passwordController,
                                    hintText: 'Password',
                                  ),
                                  CustomTextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          RouteNames.forgotpasswordScreen);
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
                                isDisabled: !(emailState.isValid &&
                                    passwordState.isValid),
                                isLoading: false,
                                onPressed: () {
                                  signupCubit.onSubmitted();
                                  emailController.clear();
                                  nameController.clear();
                                  passwordController.clear();
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
                                      Navigator.pushNamed(
                                          context, RouteNames.loginScreenTwo);
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
                  ));
        },
      ),
    );
  }
}
