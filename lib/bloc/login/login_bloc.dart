import 'dart:async';

import 'package:aiapait/bloc/login/login_event.dart';
import 'package:aiapait/bloc/login/login_state.dart';
import 'package:aiapait/bloc/login/textfield_state.dart';
import 'package:aiapait/services/login/login_api_service.dart';
import 'package:aiapait/utils/regex_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvents, MainState> {
  LoginBloc()
      : super(MainState(
            emailState: TextFieldState(),
            passwordState: TextFieldState(),
            isPasswordObscured: true)) {
    on<OnEmailChange>(_onEmailChanged);
    on<OnPasswordChange>(_onPasswordChanged);
    on<OnSubmit>(_onSubmitted);
    on<OnTogglePassword>(onTogglePassword);
  }
  final _loadingController = StreamController<bool>();
  final _errorController = StreamController<String?>();

  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<String?> get errorStream => _errorController.stream;
  void onTogglePassword(OnTogglePassword event, Emitter<MainState> emit) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  void _onEmailChanged(OnEmailChange event, Emitter<MainState> emit) {
    final updatedEmailState =
        TextFieldState(value: event.email, isValid: false, error: null);
    final currentState = state;
    if (event.email.isEmpty) {
      updatedEmailState.error = "This is a required field";
    } else if (!event.email.isValidEmail) {
      updatedEmailState.error = "Invalid email address";
    } else {
      updatedEmailState.error = null;
      updatedEmailState.isValid = true;
    }

    emit(currentState.copyWith(emailState: updatedEmailState));
  }

  void _onPasswordChanged(OnPasswordChange event, Emitter<MainState> emit) {
    final updatePasswordState =
        TextFieldState(value: event.password, isValid: false, error: null);
    final currentState = state;
    if (event.password.isEmpty) {
      updatePasswordState.error = "This is a required field";
    } else if (!event.password.isValidPassword) {
      updatePasswordState.error = "Password should be between 2 and 8 chracter";
    } else {
      updatePasswordState.error = null;
      updatePasswordState.isValid = true;
    }

    emit(currentState.copyWith(passwordState: updatePasswordState));
  }

  void _onSubmitted(OnSubmit event, Emitter<MainState> emit) async {
    _loadingController.add(true);
    final emailState = (state).emailState;
    final passwordState = (state).passwordState;
    if (emailState.error == null && passwordState.error == null) {
      final authApiService = LoginApiService.create();
      try {
        final response = await authApiService.loginUser({
          "email": state.emailState.value,
          "password": state.passwordState.value
        });
        if (response.statusCode == 200) {
        } else {
          _errorController.add("Something went wrong");
          // ignore: use_build_context_synchronously
          _showErrorSnackBar("Something went wrong",
              event.context); // Emit error message if API call fails
        }
      } catch (e) {
        _errorController
            .add(e.toString()); // Emit error message if an exception occurs
      } finally {
        _loadingController
            .add(false); // Emit loading false when the API call is complete
      }
    }
    emit(MainState(
        emailState: TextFieldState(),
        passwordState: TextFieldState(),
        isPasswordObscured: state.isPasswordObscured));
  }

  void _showErrorSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Future<void> close() {
    _loadingController.close();
    _errorController.close();
    return super.close();
  }
}
