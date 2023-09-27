import 'package:aiapait/bloc/login/login_event.dart';
import 'package:aiapait/bloc/login/login_state.dart';
import 'package:aiapait/bloc/login/textfield_state.dart';
import 'package:aiapait/services/login/login_api_service.dart';
import 'package:aiapait/utils/regex_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvents, MainState> {
  LoginBloc()
      : super(MainState(
            emailState: TextFieldState("", false, null),
            passwordState: TextFieldState("", false, null),
            isPasswordObscured: true)) {
    on<OnEmailChange>(_onEmailChanged);
    on<OnPasswordChange>(_onPasswordChanged);
    on<OnSubmit>(_onSubmitted);
    on<OnTogglePassword>(onTogglePassword);
  }
  void onTogglePassword(OnTogglePassword event, Emitter<MainState> emit) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  void _onEmailChanged(OnEmailChange event, Emitter<MainState> emit) {
    final updatedEmailState = TextFieldState(event.email, false, null);
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
    final updatePasswordState = TextFieldState(event.password, false, null);
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
    final emailState = (state).emailState;
    final passwordState = (state).passwordState;
    if (emailState.error == null && passwordState.error == null) {
      final authApiService = LoginApiService.create();
      try {
        final response = await authApiService.loginUser({
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
    emit(MainState(
        emailState: TextFieldState("", false, null),
        passwordState: TextFieldState("", false, null),
        isPasswordObscured: state.isPasswordObscured));
  }
}
