import 'package:aiapait/bloc/login/textfield_state.dart';
import 'package:aiapait/services/signup/signup_api_service.dart';
import 'package:aiapait/utils/regex_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit()
      : super(SignupState.main(
            nameState: TextFieldState(),
            emailState: TextFieldState(),
            passwordState: TextFieldState(),
            isPasswordObscured: true));
  void onNameChanged(String name) {
    final updatedNameState =
        TextFieldState(value: name, isValid: false, error: null);
    final currentState = state;
    if (name.isEmpty) {
      updatedNameState.error = "This is a required field";
    } else if (!name.isValidName) {
      updatedNameState.error = "Invalid Name";
    } else {
      updatedNameState.error = null;
      updatedNameState.isValid = true;
    }

    emit(currentState.copyWith(nameState: updatedNameState));
  }

  void onEmailChanged(String email) {
    final updatedEmailState =
        TextFieldState(value: email, isValid: false, error: null);
    final currentState = state;
    if (email.isEmpty) {
      updatedEmailState.error = "This is a required field";
    } else if (!email.isValidEmail) {
      updatedEmailState.error = "Invalid email address";
    } else {
      updatedEmailState.error = null;
      updatedEmailState.isValid = true;
    }

    emit(currentState.copyWith(emailState: updatedEmailState));
  }

  void onPasswordChanged(String password) {
    final updatePasswordState =
        TextFieldState(value: password, isValid: false, error: null);
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

  void onSubmitted() async {
    final emailState = (state).emailState;
    final passwordState = (state).passwordState;
    if (emailState.error == null && passwordState.error == null) {
      final authApiService = SignUpApiService.create();
      try {
        final response = await authApiService.signUpUser({
          "email": state.emailState.value,
          "password": state.passwordState.value
        });
        if (response.statusCode == 200) {
        } else {
          // print("Somethign went wrong ${response.error}");
        }
      } catch (e) {
        // print(e.toString());
      }
    }
    emit(SignupState.main(
        nameState: TextFieldState(),
        emailState: TextFieldState(),
        passwordState: TextFieldState(),
        isPasswordObscured: state.isPasswordObscured));
  }

  void onTogglePassword() {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }
}
