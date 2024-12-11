import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/globals.dart';
import '../constants/strings.dart';
import '../domain/helpers/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    waitForSplashScreen();
    super.initState();
  }

  waitForSplashScreen() async {
    Timer(const Duration(milliseconds: 3000), () async {
      String? token = await SharedPrefsHelpers.getData(key: "token");
      userToken = token ?? "";
      debugPrint("token $token");

      // ignore: use_build_context_synchronously
      await Navigator.pushNamedAndRemoveUntil(context,
          userToken == "" ? loginRoute : homePageRoute, (route) => false,
          arguments: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        "assets/images/splashLogo.png",
        width: 200,
        height: 200,
      )),
    );
  }
}
