import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
//import 'package:nb_utils/nb_utils.dart';
import 'package:template/app_router.dart';
import 'package:template/domain/helpers/shared_prefs.dart';

import 'bloc/bloc_observer.dart';
import 'constants/globals.dart';
import 'constants/themes.dart';
import 'domain/helpers/dio_helper.dart';
import 'domain/models/scroll_behavior.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  //await initialize();
  DioHelper.init();
  HttpOverrides.global = MyHttpOverrides();
  await SharedPrefsHelpers.init();
  //SharedPrefsHelpers.deleteData(key: "token");
  EasyLocalization.logger.enableLevels = [];
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'lib/constants/languages',
      startLocale: const Locale("en"),
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Mowakeb',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        //navigatorKey: navigatorKey,
        theme: themeData,
        themeMode: ThemeMode.light,
        darkTheme: darkThemeData,
        scrollBehavior: const MyScrollBehavior(),
        onGenerateRoute: appRouter.generateRoute,
        navigatorKey: navigatorKey,
      );
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
