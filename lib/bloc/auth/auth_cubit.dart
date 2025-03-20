import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/constants/strings.dart';
import 'package:template/domain/helpers/shared_prefs.dart';
import 'package:template/domain/models/roles_model.dart';
import 'package:template/domain/repos/auth_repo.dart';
import 'package:template/presentation/shared/toasts.dart';

import '../../constants/globals.dart';
import '../../domain/models/login_model.dart';
import '../../domain/models/users_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController loginEmailController = TextEditingController(
      text: kDebugMode || Platform.isIOS ? "superadmin" : "");
  TextEditingController loginPasswordController =
      TextEditingController(text: kDebugMode || Platform.isIOS ? "123456" : "");

  bool isVisible = false;
  var suffix = Icons.visibility_off;

  int currentChipIndex = 0;
  UsersModel? usersModel;
  RolesModel? rolesModel;
  List<Map<String, dynamic>> usersList = [];
  List<Map<String, dynamic>> rolesList = [];

  final List<String> usersItems = [
    'Code'.tr(),
    'Name'.tr(),
    'Username'.tr(),
    'Email'.tr(),
    'Role'.tr(),
    'Nationality'.tr(),
    'Status'.tr(),
  ];
  final List<String> rolesItems = ["English Name".tr(), "Arabic Name".tr()];
  List<String> selectedItems = [];
  TextEditingController userSearchController = TextEditingController();
  TextEditingController rolesSearchController = TextEditingController();
  List<Map<String, dynamic>> searchUsersList = [];
  List<Map<String, dynamic>> searchRolesList = [];
  int activeStep = 0;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController arabicRoleNameController = TextEditingController();
  TextEditingController englishRoleNameController = TextEditingController();
  String? selectedNationality;
  Set<String> selectedRoles = {};
  changeChipIndex(int index) {
    currentChipIndex = index;
    if (currentChipIndex == 1) {
      searchUsersList = [];
      for (Map<String, dynamic> element in usersList) {
        if (element["Status"] == "Active".tr()) {
          searchUsersList.add(element);
        }
      }
    }
    if (currentChipIndex == 2) {
      searchUsersList = [];
      for (Map<String, dynamic> element in usersList) {
        if (element["Status"] == "Deactivated".tr()) {
          searchUsersList.add(element);
        }
      }
    }
    emit(ChangeChipIndexState());
  }

  setNationality(String value) {
    selectedNationality = value;
    emit(SetNationalityState());
  }

  changeStep({increase = true}) {
    increase ? activeStep++ : activeStep--;
    emit(SetStepState());
  }

  changeVisibility() {
    isVisible = !isVisible;
    suffix = (!isVisible)
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(LoginChangeVisibilityState());
  }

  changeVisibleItems(item) {
    final isSelected = selectedItems.contains(item);
    isSelected ? selectedItems.remove(item) : selectedItems.add(item);
    emit(ChangeVisibleItemState());
  }

  fillSelectedItems(String route) {
    if (route == rolesRoute) {
      selectedItems = ["English Name".tr(), "Arabic Name".tr()];
    } else if (route == usersRoute) {
      selectedItems = selectedItems = [
        'Code'.tr(),
        'Name'.tr(),
        'Username'.tr(),
        'Email'.tr(),
        'Role'.tr(),
        'Status'.tr(),
      ];
    }
  }

  void login() {
    emit(LoginLoadingState());
    authRepo
        .login(loginEmailController.text, loginPasswordController.text)
        .then((value) {
      userToken = value.token!;

      debugPrint(" token == $userToken");
      emit(LoginSuccessState(value));
    }).catchError((error) {
      print(error);
      emit(LoginErrorState());
    });
  }

  void getUserById({id, currentUser = false}) async {
    emit(GetUserLoadingState());
    if (currentUser) {
      id = await SharedPrefsHelpers.getData(key: "id");
    }
    authRepo.getUserById(id).then((value) {
      userModel = value;
      emit(GetUserSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetUserErrorState());
    });
  }

  void getUsers() async {
    fillSelectedItems(usersRoute);
    emit(GetUsersLoadingState());

    authRepo.getUsers().then((value) {
      usersModel = value;
      usersList = [];
      for (var element in value.data!) {
        usersList.add({
          "Id": element.id,
          "Code": element.userCode,
          "Name": "${element.firstName!} ${element.lastName!}",
          "Username": element.userName,
          "Email": element.email,
          "Role": element.roles!.join(", "),
          "Status": element.isActive! ? "Active".tr() : "Deactivated".tr(),
          "Nationality": element.nationality,
          "Image": element.imagePath,
        });
      }
      emit(GetUsersSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetUsersErrorState());
    });
  }

  void getRoles({rolesScreen = true}) async {
    if (rolesScreen) {
      fillSelectedItems(rolesRoute);
    }

    emit(GetRolesLoadingState());

    authRepo.getRoles().then((value) {
      rolesModel = value;
      rolesList = [];
      for (var element in value.data!.result!) {
        rolesList.add({
          "Id": element.id,
          "Arabic Name": element.arabicName,
          "English Name": element.name,
        });
      }
      log(rolesList.toString());
      emit(GetRolesSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetRolesErrorState());
    });
  }

  searchUsers() {
    searchUsersList = [];
    for (Map<String, dynamic> element in usersList) {
      if (element["Name"]
          .toString()
          .toLowerCase()
          .contains(userSearchController.text.toLowerCase())) {
        searchUsersList.add(element);
      }
    }
    emit(SearchUsersState());
  }

  searchRoles() {
    searchRolesList = [];
    for (Map<String, dynamic> element in rolesList) {
      if (element["English Name"]
              .toString()
              .toLowerCase()
              .contains(rolesSearchController.text.toLowerCase()) ||
          element["Arabic Name"]
              .toString()
              .contains(rolesSearchController.text.toLowerCase())) {
        searchRolesList.add(element);
      }
    }
    emit(SearchRolesState());
  }

  deleteUser(id) {
    emit(DeleteUserLoadingState());
    authRepo.deleteUser(id).then((value) {
      if (value.statusCode == 200) {
        getUsers();
        emit(DeleteUserSuccessState());
        toast(value.data!, color: Colors.green);
      } else {
        emit(DeleteUserErrorState());
        toast(value.data!, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(DeleteUserErrorState());
    });
  }

  deleteRole(id) {
    emit(DeleteRoleLoadingState());
    authRepo.deleteRole(id).then((value) {
      if (value.statusCode == 200) {
        getRoles();
        emit(DeleteRoleSuccessState());
        toast(value.data!, color: Colors.green);
      } else {
        emit(DeleteRoleErrorState());
        toast(value.data!, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(DeleteRoleErrorState());
    });
  }

  void addRole(String roleId) {
    selectedRoles.add(roleId);
    emit(RolesSelectionUpdated());
  }

  void removeRole(String roleId) {
    selectedRoles.remove(roleId);
    emit(RolesSelectionUpdated());
  }

  addNewUser() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        userNameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        selectedNationality == null ||
        selectedRoles.isEmpty) {
      toast("Please fill all fields".tr(), color: Colors.red);
      return;
    }

    List<Map<String, dynamic>> roles = [];

    for (int index = 0; index < rolesList.length; index++) {
      var element = rolesList[index];
      bool isSelected = selectedRoles.contains(element["Id"]);
      roles.add(
        {
          "RolesString[$index]": jsonEncode(
              {"Name": element["English Name"], "IsSelected": isSelected})
        },
      );
    }

    Map<String, dynamic> data = {
      "userName": userNameController.text.trim(),
      "firstname": firstNameController.text.trim(),
      "lastname": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      "Password": passwordController.text.trim(),
      "confirmPassword": passwordController.text.trim(),
      "nationality": selectedNationality,
      "SAPSalesManCode": "-1",
    };
    for (var element in roles) {
      data.addAll(element);
    }

    print("data $data ");
    emit(AddUserLoadingState());
    authRepo.addUser(data).then((value) {
      print("value $value ");
      if (value["statusCode"] == 200) {
        emit(AddUserSuccessState());
        toast("User Created".tr(), color: Colors.green);
      } else {
        emit(AddUserErrorState());
        toast(value["data"][0]["description"], color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(AddUserErrorState());
    });
  }

  deactivateUser(String id) {
    emit(DeactivatingUserLoadingState());
    authRepo.deactivateUser(id).then((value) {
      if (value.statusCode == 200) {
        getUsers();
        emit(DeactivatingUserSuccessState());
        toast(value.data!, color: Colors.green);
      } else {
        emit(DeactivatingUserErrorState());
        toast(value.data!, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(DeactivatingUserErrorState());
    });
  }

  addNewRole() {
    if (arabicRoleNameController.text.isEmpty ||
        englishRoleNameController.text.isEmpty) {
      toast("Please fill all fields".tr(), color: Colors.red);
      return;
    }

    Map<String, dynamic> data = {
      "name": englishRoleNameController.text.trim(),
      "arabicName": arabicRoleNameController.text.trim(),
    };

    print("data $data ");
    emit(AddRoleLoadingState());
    authRepo.addRole(data).then((value) {
      print("value $value ");
      if (value.statusCode == 200) {
        emit(AddRoleSuccessState());
        toast(value.data, color: Colors.green);
      } else {
        emit(AddRoleErrorState());
        toast(value.data, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(AddRoleErrorState());
    });
  }

  editRole(id) {
    if (arabicRoleNameController.text.isEmpty ||
        englishRoleNameController.text.isEmpty) {
      toast("Please fill all fields".tr(), color: Colors.red);
      return;
    }

    Map<String, dynamic> data = {
      "name": englishRoleNameController.text.trim(),
      "arabicName": arabicRoleNameController.text.trim(),
      "id": id
    };

    print("data $data ");
    emit(EditRoleLoadingState());
    authRepo.editRole(data).then((value) {
      print("value $value ");
      if (value.statusCode == 200) {
        emit(EditRoleSuccessState());
        toast(value.data, color: Colors.green);
      } else {
        emit(EditRoleErrorState());
        toast(value.data, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(EditRoleErrorState());
    });
  }

  initRoleScreen(args) {
    arabicRoleNameController.clear();
    englishRoleNameController.clear();
    if (args["isEdit"]) {
      Map role =
          rolesList.firstWhere((element) => element["Id"] == args["roleId"]);
      arabicRoleNameController.text = role["Arabic Name"];
      englishRoleNameController.text = role["English Name"];
    }
  }

  initUserScreen(args) {
    activeStep = 0;
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    userNameController.clear();
    passwordController.clear();
    selectedNationality = null;
    selectedRoles.clear();
    if (args["isEdit"]) {
      Map user =
          usersList.firstWhere((element) => element["Id"] == args["userId"]);
      firstNameController.text = user["Name"].split(" ")[0];
      lastNameController.text = user["Name"].split(" ")[1];
      emailController.text = user["Email"];
      userNameController.text = user["Username"];
      selectedNationality = user["Nationality"];
      for (var element in rolesList) {
        if (user["Role"].contains(element["English Name"])) {
          selectedRoles.add(element["Id"]);
        }
      }
    }
  }

  editUser(id) {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        userNameController.text.isEmpty ||
        selectedNationality == null ||
        selectedRoles.isEmpty) {
      toast("Please fill all fields".tr(), color: Colors.red);
      return;
    }

    List<Map<String, dynamic>> roles = [];

    for (int index = 0; index < rolesList.length; index++) {
      var element = rolesList[index];
      bool isSelected = selectedRoles.contains(element["Id"]);
      roles.add(
        {
          "RolesIds[$index]": jsonEncode(
              {"Name": element["English Name"], "IsSelected": isSelected})
        },
      );
    }

    Map<String, dynamic> data = {
      "userName": userNameController.text.trim(),
      "firstname": firstNameController.text.trim(),
      "lastname": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      "Password": passwordController.text.trim(),
      "confirmPassword": passwordController.text.trim(),
      "nationality": selectedNationality,
      "SAPSalesManCode": "-1",
      "id": id
    };
    for (var element in roles) {
      data.addAll(element);
    }

    print("data $data ");
    emit(EditUserLoadingState());
    authRepo.editUser(data).then((value) {
      print("value $value ");
      if (value["statusCode"] == 200) {
        emit(EditUserSuccessState());
        toast("User Edited", color: Colors.green);
      } else {
        emit(EditUserErrorState());
        //toast(value["data"][0]["description"], color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(EditUserErrorState());
    });
  }
}
