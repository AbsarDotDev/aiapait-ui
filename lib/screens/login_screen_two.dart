import 'package:aiapait/bloc/login/login_bloc.dart';
import 'package:aiapait/bloc/login/login_event.dart';
import 'package:aiapait/bloc/login/login_state.dart';
import 'package:aiapait/utils/colors.dart';
import 'package:aiapait/utils/route_names.dart';

import 'package:aiapait/widgets/custom_button.dart';
import 'package:aiapait/widgets/custom_text.dart';
import 'package:aiapait/widgets/custom_textfield.dart';
import 'package:aiapait/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenTwo extends StatefulWidget {
  const LoginScreenTwo({super.key});

  @override
  State<LoginScreenTwo> createState() => _LoginScreenTwoState();
}

class _LoginScreenTwoState extends State<LoginScreenTwo> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

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
      body: BlocBuilder<LoginBloc, MainState>(
        builder: (context, state) {
          final LoginBloc loginBloc = context.read<LoginBloc>();
          final emailError = loginBloc.state.emailState.error;
          final passwordError = loginBloc.state.passwordState.error;
          return Stack(
            children: [
              const ModalBarrier(
                // Add a modal barrier to block user interaction
                dismissible: false,
              ),
              StreamBuilder<bool>(
                  stream: loginBloc.loadingStream,
                  initialData: false,
                  builder: (context, AsyncSnapshot snapshot) {
                    return IgnorePointer(
                      ignoring: snapshot.data!,
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.values[2],
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
                                      CustomTextField(
                                        isValid: state.emailState.isValid,
                                        errorMessage: emailError,
                                        onChanged: (email) {
                                          loginBloc.add(OnEmailChange(email));
                                        },
                                        currentNode: emailFocusNode,
                                        nextNode: passwordFocusNode,
                                        preFixIcon: Icons.mail,
                                        controller: emailController,
                                        hintText: 'Email',
                                      ),
                                      CustomTextField(
                                        isValid: state.passwordState.isValid,
                                        errorMessage: passwordError,
                                        onChanged: (password) {
                                          loginBloc
                                              .add(OnPasswordChange(password));
                                        },
                                        currentNode: passwordFocusNode,
                                        obscureText:
                                            loginBloc.state.isPasswordObscured,
                                        suffixIcon:
                                            loginBloc.state.isPasswordObscured
                                                ? const Icon(Icons.visibility)
                                                : const Icon(
                                                    Icons.visibility_off_sharp),
                                        suffixOnTap: () {
                                          loginBloc.add(OnTogglePassword());
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
                                    isDisabled: !(state.emailState.isValid &&
                                        state.passwordState.isValid),
                                    isLoading: snapshot.data!,
                                    onPressed: () {
                                      loginBloc.add(OnSubmit(context: context));
                                      emailController.clear();
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
                                          Navigator.pushNamed(context,
                                              RouteNames.signupScreenTwo);
                                        },
                                        text: "Register Now",
                                        fontSize: 14,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                        isLink: true,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ],
          );
        },
      ),
    );
  }
}
