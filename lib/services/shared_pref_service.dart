import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static SharedPreferences prefs;
  static Future<dynamic> setSharedPreference() async {
//    Completer c = Completer();

    SharedPrefService.prefs ??= await SharedPreferences.getInstance();
    await prefs.setBool('initialised', true);
  }
}
