import 'package:template/domain/models/response_model.dart';
import 'package:template/domain/models/roles_model.dart';
import 'package:template/domain/models/user_model.dart';

import '../api/auth_api.dart';
import '../models/login_model.dart';
import '../models/users_model.dart';

class AuthRepo {
  final AuthApi authApi;

  AuthRepo(this.authApi);
  Future<LoginModel> login(email, password) async {
    final response = await authApi.login(email, password);
    return LoginModel.fromJson(response);
  }

  Future<UserModel> getUserById(id) async {
    final response = await authApi.getUserById(id);
    return UserModel.fromJson(response);
  }

  Future<UsersModel> getUsers() async {
    final response = await authApi.getUsers();
    return UsersModel.fromJson(response);
  }

  Future<RolesModel> getRoles() async {
    final response = await authApi.getRoles();
    return RolesModel.fromJson(response);
  }

  Future<Response> deleteUser(String id) async {
    final response = await authApi.deleteUser(id);

    return Response.fromJson(response);
  }

  Future<Response> deleteRole(String id) async {
    final response = await authApi.deleteRole(id);

    return Response.fromJson(response);
  }

  Future<dynamic> addUser(Map<String, dynamic> data) async {
    final response = await authApi.addUser(data);

    return response;
  }

  Future<Response> deactivateUser(String id) async {
    final response = await authApi.deactivateUser(id);

    return Response.fromJson(response);
  }

  Future<Response> addRole(Map<String, dynamic> data) async {
    final response = await authApi.addRole(data);

    return Response.fromJson(response);
  }

  Future<Response> editRole(Map<String, dynamic> data) async {
    final response = await authApi.editRole(data);

    return Response.fromJson(response);
  }

  Future<dynamic> editUser(Map<String, dynamic> data) async {
    final response = await authApi.editUser(data);

    return response;
  }
}
