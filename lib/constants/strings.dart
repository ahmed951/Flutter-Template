import 'package:flutter/foundation.dart';

import 'globals.dart';

String baseUrl = isServer
    ? "http://173.249.60.28:60772/"
    : kIsWeb
        ? "http://127.0.0.1:60772/"
        : "http://10.0.2.2:60772/";

const String loginApi = "api/authenticate/login";

/* Routes */

const String loginRoute = "/login";
const String homePageRoute = "/homepage";
