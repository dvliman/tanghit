import 'package:flutter/material.dart';
import 'package:tanghit/screens/login_screen.dart';
import 'package:tanghit/screens/sign_up_screen.dart';
import 'package:tanghit/screens/temp_bottom_navigation.dart';
import 'package:tanghit/utils/constants.dart';

class Routes {
  var routes = <String, WidgetBuilder>{
    "/logInScreen": (BuildContext context) => LoginScreen(),
    "/signUpScreen": (BuildContext context) => SignUpScreen(),
    "/": (BuildContext context) => TempBottomNavigation(),
  };

  Routes() {
    runApp(
      MaterialApp(
        routes: routes,
        initialRoute: "/",
        navigatorKey: rootNavigatorKey,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
