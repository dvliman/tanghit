import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanghit/screens/detail_page.dart';
import 'package:tanghit/screens/entryscreens/login_screen.dart';
import 'package:tanghit/screens/entryscreens/sign_up_screen.dart';
import 'package:tanghit/utils/constants.dart';

class Routes {
  Routes() {
    runApp(
      Platform.isIOS
          ? MaterialApp(
              routes: routes,
              navigatorKey: rootNavigatorKey,
              debugShowCheckedModeBanner: false,
            )
          : MaterialApp(
              routes: routes,
              navigatorKey: rootNavigatorKey,
              debugShowCheckedModeBanner: false,
            ),
    );
  }

  var routes = <String, WidgetBuilder>{
//    "/": (BuildContext context) => WelcomeScreen(),
    "/logInScreen": (BuildContext context) => LoginScreen(),
    "/signUpScreen": (BuildContext context) => SignUpScreen(),
    "/": (BuildContext context) => ShopDetailPage(),
  };
}
