// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aiapait/bloc/login/textfield_state.dart';

class MainState {
  TextFieldState emailState;
  TextFieldState passwordState;
  bool isPasswordObscured = true;

  MainState(
      {required this.emailState,
      required this.passwordState,
      required this.isPasswordObscured});
  MainState copyWith(
      {TextFieldState? emailState,
      TextFieldState? passwordState,
      bool? isPasswordObscured}) {
    return MainState(
        emailState: emailState ?? this.emailState,
        passwordState: passwordState ?? this.passwordState,
        isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured);
  }
}
