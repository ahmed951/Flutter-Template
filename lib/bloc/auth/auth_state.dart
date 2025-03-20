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

class LoginErrorState extends AuthStates {}

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

class GetUserLoadingState extends AuthStates {}

class GetUserSuccessState extends AuthStates {}

class GetUserErrorState extends AuthStates {}

class ChangeChipIndexState extends AuthStates {}

class ChangeVisibleItemState extends AuthStates {}

class GetUsersLoadingState extends AuthStates {}

class GetUsersSuccessState extends AuthStates {}

class GetUsersErrorState extends AuthStates {}

class SearchUsersState extends AuthStates {}

class SearchRolesState extends AuthStates {}

class GetRolesLoadingState extends AuthStates {}

class GetRolesSuccessState extends AuthStates {}

class GetRolesErrorState extends AuthStates {}

class DeleteUserLoadingState extends AuthStates {}

class DeleteUserSuccessState extends AuthStates {}

class DeleteUserErrorState extends AuthStates {}

class DeleteRoleLoadingState extends AuthStates {}

class DeleteRoleSuccessState extends AuthStates {}

class DeleteRoleErrorState extends AuthStates {}

class SetNationalityState extends AuthStates {}

class SetStepState extends AuthStates {}

class RolesSelectionUpdated extends AuthStates {}

class AddUserLoadingState extends AuthStates {}

class AddUserSuccessState extends AuthStates {}

class AddUserErrorState extends AuthStates {}

class DeactivatingUserLoadingState extends AuthStates {}

class DeactivatingUserSuccessState extends AuthStates {}

class DeactivatingUserErrorState extends AuthStates {}

class AddRoleLoadingState extends AuthStates {}

class AddRoleSuccessState extends AuthStates {}

class AddRoleErrorState extends AuthStates {}

class EditRoleLoadingState extends AuthStates {}

class EditRoleSuccessState extends AuthStates {}

class EditRoleErrorState extends AuthStates {}

class EditUserLoadingState extends AuthStates {}

class EditUserSuccessState extends AuthStates {}

class EditUserErrorState extends AuthStates {}
