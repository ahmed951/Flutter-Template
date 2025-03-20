import 'package:flutter/material.dart';

import 'globals.dart';

Future pushNavigate(context, route, {arguments}) {
  return Navigator.pushNamed(context, route, arguments: arguments);
}

pushReplaceNavigate(context, route, {arguments}) {
  Navigator.pushReplacementNamed(context, route, arguments: arguments);
}

pushUntilNavigate(context, route, {arguments}) {
  Navigator.pushNamedAndRemoveUntil(context, route, (route) => false,
      arguments: arguments);
}

pop(context) {
  Navigator.pop(context);
}

havePermission(permission) {
  return userPermissionsList.contains(permission);
}

havePermissions(List<String> permissions) {
  for (var permission in permissions) {
    if (!userPermissionsList.contains(permission)) {
      return false;
    }
  }
  return true;
}
