abstract class LoginEvents {}

class OnEmailChange extends LoginEvents {
  final String email;

  OnEmailChange(this.email);
}

class OnPasswordChange extends LoginEvents {
  final String password;

  OnPasswordChange(this.password);
}

class OnSubmit extends LoginEvents {}
