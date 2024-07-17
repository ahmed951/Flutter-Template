import 'package:template/domain/api/app_api.dart';

class AppRepo {
  final AppApi appApi;

  AppRepo(this.appApi);

  /* Future<NormalUserDataModel> getUserData() async {
    final user = await appApi.getApiData();

    return NormalUserDataModel.fromJson(user);
  } */
}
