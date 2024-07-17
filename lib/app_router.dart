import 'package:flutter/material.dart';
import 'package:template/domain/api/app_api.dart';

import 'bloc/app_cubit_cubit.dart';
import 'domain/repos/app_repo.dart';
import 'main.dart';

class AppRouter {
  late AppRepo appRepo;
  late AppCubit appCubit;

  AppRouter() {
    appRepo = AppRepo(AppApi());
    appCubit = AppCubit(appRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
    }

    return null;
  }
}
