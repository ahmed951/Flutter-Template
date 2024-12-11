import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/domain/api/app_api.dart';
import 'package:template/presentation/screens/login/login.dart';
import 'package:template/presentation/splash_screen.dart';

import 'bloc/app_cubit.dart';
import 'bloc/auth/auth_cubit.dart';
import 'constants/strings.dart';
import 'domain/api/auth_api.dart';
import 'domain/repos/app_repo.dart';
import 'domain/repos/auth_repo.dart';

class AppRouter {
  late AppRepo appRepo;
  late AppCubit appCubit;
  late AuthRepo authRepo;
  late AuthCubit authCubit;

  AppRouter() {
    appRepo = AppRepo(AppApi());
    appCubit = AppCubit(appRepo);
    authRepo = AuthRepo(AuthApi());
    authCubit = AuthCubit(authRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(authRepo),
                  child: LoginScreen(),
                ));
    }

    return null;
  }
}
