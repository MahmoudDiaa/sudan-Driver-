abstract class LoginStates {}

class RegisterInitialState extends LoginStates {}

class RegisterSuccessState extends LoginStates {
  String message;
  RegisterSuccessState(this.message);

}

class RegisterLoadingState extends LoginStates {}

class RegisterFailedState extends LoginStates {
  String error;

  RegisterFailedState(this.error);
}
