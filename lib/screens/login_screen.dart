import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tanghit/services/screen_ratio.dart';
import 'package:tanghit/services/shared_pref_service.dart';
import 'package:tanghit/utils/custom_text.dart';
import 'package:tanghit/utils/custom_text_field.dart';
import 'package:tanghit/widgets/appButton/log_in_button.dart';
import 'package:tanghit/widgets/appButton/sign_in_button.dart';
import 'package:validators/validators.dart';

import '../services/screen_ratio.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    initialisation();
    super.initState();
  }

  initialisation() async {
    await SharedPrefService.setSharedPreference();
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isValidated = false;
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    ScreenRatio.setScreenRatio(
        currentScreenHeight: screenSize.height,
        currentScreenWidth: screenSize.width);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Builder(builder: (context) {
            return Form(
              key: _formKey,
              child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 100.0 * ScreenRatio.heightRatio,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                        EdgeInsets.only(left: 30 * ScreenRatio.widthRatio),
                        child: CustomText(
                          customText: "Sign In",
                          textColor: Colors.teal,
                          fontSize: 31 * ScreenRatio.widthRatio,
                          align: TextAlign.left,
                        ),
                      )),
                  Divider(
                    thickness: 5.0 * ScreenRatio.heightRatio,
                    color: Colors.red,
                    indent: 30 * ScreenRatio.widthRatio,
                    endIndent: 312 * ScreenRatio.widthRatio,
                  ),
                  SizedBox(
                    height: 40.0 * ScreenRatio.heightRatio,
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            CustomTextField(
                              style: TextStyle(color: Colors.black),
                              controller: emailcontroller,
                              keyboardType: TextInputType.text,
                              onSaved: (v) {
                                print(v);
                              },
                              onTap: (){
                                setState(() {
                                  _selected = false;
                                });
                              },
                              labelText: "Email",
                              width: 315 * ScreenRatio.widthRatio,
                              height: 50 * ScreenRatio.heightRatio,
                              icon: Icon(Icons.mail_outline),
                              validatorFunction: (value) {
                                if (value.isEmpty) {
                                  return "Please enter some text";
                                }
                                String message = !EmailValidator.validate(value)
                                    ? "Not a valid email"
                                    : null;
                                setState(() {
                                  isValidated = true;
                                });
                                return message;
                              },
                            ),
                            SizedBox(
                              height: 30.0 * ScreenRatio.heightRatio,
                            ),
                            CustomTextField(
                              style: TextStyle(color: Colors.black),
                              controller: passwordcontroller,
                              onTap: (){
                                setState(() {
                                  _selected = true;
                                });
                              },
                              keyboardType: TextInputType.text,
                              onSaved: (v) {
                                print(v);
                              },
                              labelText: "Password",
                              obscureText: true,
                              width: 315 * ScreenRatio.widthRatio,
                              height: 50 * ScreenRatio.heightRatio,


                              icon: Container(

                                height: 24 * ScreenRatio.heightRatio,
                                width: 24 * ScreenRatio.heightRatio,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/icons/email.svg',
                                  height: 24 * ScreenRatio.heightRatio,
                                  width: 24 * ScreenRatio.heightRatio,
                                  fit: BoxFit.contain,
                                  color: _selected ? Colors.orangeAccent : Colors.grey,

                                ),

                              ),
                              validatorFunction: (value) {
                                if (value.isEmpty) {
                                  return "Please enter some text";
                                }
                                var message =
                                (!isAlphanumeric(value.toString()))
                                    ? "Enter a valid password"
                                    : null;
                                setState(() {
                                  isValidated = true;
                                });
                                return message;
                              },
                            ),
                            SizedBox(
                              height: 30.0 * ScreenRatio.heightRatio,
                            ),
                            SignInButton(
                              bgColor: Colors.orangeAccent ,
                              onTapFunction: () {
                                setState(() {
                                  _selected = false;
                                });
                                if (_formKey.currentState.validate()) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("Processing data")));
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("Unauthorized access")));
                                }
                              },
                              width: 315 * ScreenRatio.widthRatio,
                              buttonText: "SIGN IN",
                              height: 50.0 * ScreenRatio.heightRatio,
                              textColor: Colors.white,
                              textFontSize: 20.0,
                            ),
                            SizedBox(
                              height: 30.0 * ScreenRatio.heightRatio,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 17.5 * ScreenRatio.widthRatio,
                                    ),
                                    child: Text(
                                      "Terms of Use",
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontSize:
                                          19 * ScreenRatio.widthRatio),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17.5 * ScreenRatio.widthRatio,
                                  ),
                                  Text(
                                    "Privacy Policy",
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 19 * ScreenRatio.widthRatio),
                                  ),
                                ])
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
