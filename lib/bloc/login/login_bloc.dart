import 'package:aiapait/bloc/login/login_event.dart';
import 'package:aiapait/bloc/login/login_state.dart';
import 'package:aiapait/bloc/login/textfield_state.dart';
import 'package:aiapait/services/auth_api_service.dart';
import 'package:aiapait/utils/regex_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvents, MainState> {
  LoginBloc()
      : super(MainState(
          emailState: TextFieldState("", false, null),
          passwordState: TextFieldState("", false, null),
        )) {
    on<OnEmailChange>(_onEmailChanged);
    on<OnPasswordChange>(_onPasswordChanged);
    on<OnSubmit>(_onSubmitted);
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
      print("hello");
      final authApiService = AuthApiService.create();
      try {
        final response = await authApiService.loginUser(
            {"email": "eve.holt@reqres.in", "password": "cityslicka"});
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
        passwordState: TextFieldState("", false, null)));
  }
}
