abstract class LoginEvent {}

class UseridEvent extends LoginEvent {
  final String userid;
  UseridEvent(this.userid);
}

class PasswordEvent extends LoginEvent {
  final String password;
  PasswordEvent(this.password);
}

class OnLoginEvent extends LoginEvent {}