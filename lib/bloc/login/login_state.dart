// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aiapait/bloc/login/textfield_state.dart';

class MainState {
  TextFieldState emailState;
  TextFieldState passwordState;
  MainState({
    required this.emailState,
    required this.passwordState,
  });
  MainState copyWith({
    TextFieldState? emailState,
    TextFieldState? passwordState,
  }) {
    return MainState(
        emailState: emailState ?? this.emailState,
        passwordState: passwordState ?? this.emailState);
  }
}
