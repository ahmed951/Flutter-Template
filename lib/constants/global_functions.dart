import 'package:flutter/material.dart';

pushNavigate(context, route, {arguments}) {
  Navigator.pushNamed(context, route, arguments: arguments);
}

pushReplaceNavigate(context, route, {arguments}) {
  Navigator.pushReplacementNamed(context, route, arguments: arguments);
}

pushUntilNavigate(context, route, {arguments}) {
  Navigator.pushNamedAndRemoveUntil(context, route, (route) => false,
      arguments: arguments);
}
