// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class LoginEvents {}

class OnEmailChange extends LoginEvents {
  final String email;

  OnEmailChange(this.email);
}

class OnPasswordChange extends LoginEvents {
  final String password;

  OnPasswordChange(this.password);
}

class OnSubmit extends LoginEvents {
  final BuildContext context;

  OnSubmit({required this.context});
}

class OnTogglePassword extends LoginEvents {}
