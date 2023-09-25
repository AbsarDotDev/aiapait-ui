import 'package:aiapait/bloc/login/login_event.dart';
import 'package:aiapait/bloc/login/login_state.dart';
import 'package:aiapait/bloc/login/textfield_state.dart';
import 'package:aiapait/utils/regex_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvents, MainState> {
  LoginBloc()
      : super(MainState(
            emailState: TextFieldState(
              "",
            ),
            passwordState: TextFieldState(
              "",
            ))) {
    on<OnEmailChange>(_onEmailChanged);
    on<OnPasswordChange>(_onPasswordChanged);
    on<OnSubmit>(_onSubmitted);
  }
  void _onEmailChanged(OnEmailChange event, Emitter<MainState> emit) {
    final updatedEmailState = TextFieldState(event.email);
    print(event.email);
    if (event.email.isEmpty) {
      updatedEmailState.error = "This is a required field";
    } else if (!event.email.isValidEmail) {
      updatedEmailState.error = "Invalid email address";
    } else {
      updatedEmailState.error = null; // Clear the error message if valid
    }
    final currentState = state;
    emit(currentState.copyWith(
        emailState: updatedEmailState,
        passwordState: currentState.passwordState));
  }

  void _onPasswordChanged(OnPasswordChange event, Emitter<MainState> emit) {
    final updatePasswordState = TextFieldState(event.password);
    if (event.password.isEmpty) {
      updatePasswordState.error = "This is a required field";
    } else if (!event.password.isValidPassword) {
      updatePasswordState.error = "Password should be between 2 and 8 chracter";
    } else {
      updatePasswordState.error = null; // Clear the error message if valid
    }
    final currentState = state;
    emit(currentState.copyWith(
        passwordState: updatePasswordState,
        emailState: currentState.emailState));
  }

  void _onSubmitted(OnSubmit event, Emitter<MainState> emit) {
    final emailState = (state).emailState;
    final passwordState = (state).passwordState;
    if (emailState.error == null && passwordState.error == null) {
      print(
          "Your email is ${emailState.value} and password is ${passwordState.value}");
    }
  }
}
