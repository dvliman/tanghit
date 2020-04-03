import 'package:flutter/material.dart';
import 'package:tanghit/services/screen_ratio.dart';
import 'package:tanghit/services/shared_pref_service.dart';
import 'package:tanghit/widgets/appButton/log_in_button.dart';
import 'package:tanghit/widgets/customText/custom_text.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    initialisation();
    super.initState();
  }
  initialisation() async {
    await SharedPrefService.setSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    ScreenRatio.setScreenRatio(
        currentScreenHeight: screenSize.height,
        currentScreenWidth: screenSize.width);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 650 * ScreenRatio.heightRatio,
            width: screenSize.width,
            decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage('assets/images/wedding2.jpg')
              )
            ),


          ),

          CustomText(
            customText: "Tanghit",
            textColor: Colors.amber,
            fontSize:45,
          ),
          SizedBox(
            height: 30.0 * ScreenRatio.heightRatio,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LogInButton(
                width: 146 * ScreenRatio.widthRatio,
                height: 48 * ScreenRatio.heightRatio,
                buttonText: CustomText(
                  customText: "Log in",
                  textColor: Colors.amber,
                ),
                textFontSize: 22 * ScreenRatio.heightRatio,
                onTapFunction: (){
                  Navigator.pushNamed(context, "/logInScreen");
                },
              ),
              SizedBox(width: 23 * ScreenRatio.widthRatio,),
              LogInButton(
                width: 146 * ScreenRatio.widthRatio,
                height: 48 * ScreenRatio.heightRatio,
                buttonText: CustomText(
                  customText: "Sign Up",
                  textColor: Colors.amber,
                ),
                textFontSize: 22 * ScreenRatio.heightRatio,
                onTapFunction: (){
                  Navigator.pushNamed(context, "/signUpScreen");
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
