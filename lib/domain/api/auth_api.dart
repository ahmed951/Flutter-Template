import 'package:template/domain/api/app_api.dart';
import '../../constants/strings.dart';

class AuthApi {
  final AppApi appApi = AppApi();
  Future<Map<String, dynamic>> login(email, password) async {
    return appApi.postApiData(loginApi, {"email": email, "password": password});
  }
}
