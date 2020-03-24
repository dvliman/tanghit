import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static SharedPreferences prefs;
  static Future<dynamic> setSharedPreference() async {
    Completer c = Completer();

    if (SharedPrefService.prefs == null)
      SharedPrefService.prefs = await SharedPreferences.getInstance();
    prefs.setBool("initialised", true);
  }
}
