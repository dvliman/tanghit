import 'package:flutter/material.dart';
import 'package:tanghit/services/screen_ratio.dart';
import '../services/shared_pref_service.dart';
import '../services/screen_ratio.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double hf = ScreenRatio.heightRatio;
  double wf = ScreenRatio.widthRatio;

  @override
  void initState() {
    super.initState();
    initialisation();
  }

  void initialisation() async {
    await SharedPrefService.setSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: Image.asset('assets/images/background.png')),
      ),
    );
  }
}
