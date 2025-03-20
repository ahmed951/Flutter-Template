import 'package:template/domain/api/app_api.dart';
import '../../constants/strings.dart';

class AuthApi {
  final AppApi appApi = AppApi();
  Future<Map<String, dynamic>> login(email, password) async {
    return appApi.postApiData(loginApi, {"email": email, "password": password});
  }

  Future<Map<String, dynamic>> getUserById(id) async {
    return appApi.getApiData("$getUserApi/$id");
  }

  Future<Map<String, dynamic>> getUsers() async {
    return appApi.getApiData(getUsersApi);
  }

  Future<Map<String, dynamic>> getRoles() async {
    return appApi.getApiData(getRolesApi);
  }

  Future<dynamic> deleteUser(String id) async {
    return appApi.deleteApiData(deleteUserApi, id: id);
  }

  Future<dynamic> deleteRole(String id) async {
    return appApi.deleteApiData(deleteRoleApi, id: id);
  }

  Future<dynamic> deactivateUser(String id) async {
    return appApi.postApiData("$deactivateUserApi/$id/false", {});
  }

  Future<dynamic> addUser(Map<String, dynamic> data) async {
    return appApi.postApiData(
      addUserApi,
      data,
      isForm: true,
    );
  }

  Future<dynamic> addRole(Map<String, dynamic> data) async {
    return appApi.postApiData(
      addRoleApi,
      data,
    );
  }

  Future<dynamic> editRole(Map<String, dynamic> data) async {
    return appApi.postApiData(
      editRoleApi.replaceAll("{id}", data["id"].toString()),
      data,
    );
  }

  Future<dynamic> editUser(Map<String, dynamic> data) async {
    return appApi.patchApiData(
      "$editUserApi/${data["id"]}",
      data,
      isForm: true,
    );
  }
}
