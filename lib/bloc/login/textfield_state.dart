// ignore_for_file: public_member_api_docs, sort_constructors_first
class TextFieldState<T> {
  T value;
  bool isValid;
  String? error;

  TextFieldState(
    this.value,
    this.isValid,
    this.error,
  );
}
