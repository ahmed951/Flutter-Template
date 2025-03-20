import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../domain/models/user_model.dart';

String userToken = "";
UserModel userModel = UserModel();
bool isServer = true || kReleaseMode;
EdgeInsets defaultPadding = const EdgeInsets.all(20);
List<String> userPermissionsList = [];
List<String> roles = [];
bool showFilter = false;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
