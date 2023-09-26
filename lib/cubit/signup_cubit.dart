import 'package:aiapait/bloc/login/textfield_state.dart';
import 'package:aiapait/services/auth_api_service.dart';
import 'package:aiapait/utils/regex_checker.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit()
      : super(SignupState.main(
            nameState: TextFieldState("", false, null),
            emailState: TextFieldState("", false, null),
            passwordState: TextFieldState("", false, null),
            isPasswordObscured: true));
  void onEmailChanged(String email, Emitter<SignupState> emit) {
    final updatedEmailState = TextFieldState(email, false, null);
    final currentState = state;
    if (email.isEmpty) {
      updatedEmailState.error = "This is a required field";
    } else if (email.isValidEmail) {
      updatedEmailState.error = "Invalid email address";
    } else {
      updatedEmailState.error = null;
      updatedEmailState.isValid = true;
    }

    emit(currentState.copyWith(emailState: updatedEmailState));
  }

  void onPasswordChanged(String password, Emitter<SignupState> emit) {
    final updatePasswordState = TextFieldState(password, false, null);
    final currentState = state;
    if (password.isEmpty) {
      updatePasswordState.error = "This is a required field";
    } else if (!password.isValidPassword) {
      updatePasswordState.error = "Password should be between 2 and 8 chracter";
    } else {
      updatePasswordState.error = null;
      updatePasswordState.isValid = true;
    }

    emit(currentState.copyWith(passwordState: updatePasswordState));
  }

  void onSubmitted(Emitter<SignupState> emit) async {
    final emailState = (state).emailState;
    final passwordState = (state).passwordState;
    final nameState = (state).nameState;
    if (emailState.error == null && passwordState.error == null) {
      final authApiService = AuthApiService.create();
      try {
        final response = await authApiService.signUpUser({
          "email": "${state.emailState.value}",
          "password": "${state.passwordState.value}"
        });
        if (response.statusCode == 200) {
          print(response.body);
        } else {
          print("Somethign went wrong ${response.error}");
        }
      } catch (e) {
        print(e.toString());
      }
    }
    emit(SignupState.main(
        nameState: TextFieldState("", false, null),
        emailState: TextFieldState("", false, null),
        passwordState: TextFieldState("", false, null),
        isPasswordObscured: state.isPasswordObscured));
  }
}
