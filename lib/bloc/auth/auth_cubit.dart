import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/domain/repos/auth_repo.dart';

import '../../constants/globals.dart';
import '../../domain/models/login_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController loginEmailController = TextEditingController(
      text: kDebugMode || Platform.isIOS ? "a99.bdr@gmail.com" : "");
  TextEditingController loginPasswordController = TextEditingController(
      text: kDebugMode || Platform.isIOS ? "a1234567" : "");

  bool acceptConditions = false;
  bool openGenderBox = false;

  bool isVisible = false;
  bool isVisible2 = false;
  var suffix = Icons.visibility_off;
  var suffix2 = Icons.visibility_off;

  changeVisibility() {
    isVisible = !isVisible;
    suffix = (!isVisible)
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(LoginChangeVisibilityState());
  }

  changeVisibility2() {
    isVisible2 = !isVisible2;
    suffix2 = (!isVisible2)
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(LoginChangeVisibilityState());
  }

  openGenderBoxFunc() {
    openGenderBox = !openGenderBox;
    emit(RegisterChangeGenderState());
  }

  void login() {
    emit(LoginLoadingState());
    authRepo
        .login(loginEmailController.text, loginPasswordController.text)
        .then((value) {
      debugPrint(value.data.toString());
      if (value.statusCode == 200) {
        //refresh(id);
        //log(value.toString());
        userToken = value.data!.token!;

        debugPrint(" token == $userToken");
        emit(LoginSuccessState(value));
      } else {
        debugPrint("status code : ${value.statusCode}");
        emit(LoginErrorState(value.message!));
      }
    }).catchError((error) {
      debugPrint(error);
      emit(LoginErrorState(error.toString()));
    });
  }
}
