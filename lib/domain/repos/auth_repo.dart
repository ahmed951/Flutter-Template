import '../api/auth_api.dart';
import '../models/login_model.dart';

class AuthRepo {
  final AuthApi authApi;

  AuthRepo(this.authApi);
  Future<LoginModel> login(email, password) async {
    final token = await authApi.login(email, password);
    return LoginModel.fromJson(token);
  }
}
