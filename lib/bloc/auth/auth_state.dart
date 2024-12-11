part of 'auth_cubit.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoginChangeVisibilityState extends AuthStates {}

class RegisterChangeGenderState extends AuthStates {}

class RegisterChangeAcceptConditionsState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends AuthStates {
  final String error;

  LoginErrorState(this.error);
}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
  final LoginModel response;

  RegisterSuccessState(this.response);
}

class RegisterErrorState extends AuthStates {
  final String error;

  RegisterErrorState(this.error);
}

class ForgetPasswordLoadingState extends AuthStates {}

class ForgetPasswordSuccessState extends AuthStates {}

class ForgetPasswordErrorState extends AuthStates {
  final String error;

  ForgetPasswordErrorState(this.error);
}

class VerifyOTPLoadingState extends AuthStates {}

class VerifyOTPSuccessState extends AuthStates {}

class VerifyOTPErrorState extends AuthStates {
  final String error;

  VerifyOTPErrorState(this.error);
}

class RestPasswordLoadingState extends AuthStates {}

class RestPasswordSuccessState extends AuthStates {}

class RestPasswordErrorState extends AuthStates {
  final String error;

  RestPasswordErrorState(this.error);
}

class ConfirmEmailLoadingState extends AuthStates {}

class ConfirmEmailSuccessState extends AuthStates {}

class ConfirmEmailErrorState extends AuthStates {
  final String error;

  ConfirmEmailErrorState(this.error);
}
