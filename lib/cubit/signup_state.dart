part of 'signup_cubit.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.main(
      {required TextFieldState nameState,
      required TextFieldState emailState,
      required TextFieldState passwordState,
      required bool isPasswordObscured}) = _Main;
}
