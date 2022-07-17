abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  String message;
  LoginSuccessState(this.message);

}

class LoginLoadingState extends LoginStates {}

class LoginFailedState extends LoginStates {
  String error;

  LoginFailedState(this.error);
}
