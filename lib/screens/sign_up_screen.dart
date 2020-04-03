import 'package:flutter/material.dart';
import 'package:tanghit/services/screen_ratio.dart';
import 'package:tanghit/services/shared_pref_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanghit/utils/custom_text.dart';
import 'package:tanghit/utils/custom_text_field.dart';
import 'package:tanghit/widgets/appButton/sign_in_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:validators/validators.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isValidated = false;

  @override
  void initState() {
    initialisation();
    super.initState();
  }

  initialisation() async {
    await ScreenRatio.setScreenRatio();
    await SharedPrefService.setSharedPreference();
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

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
                children: <Widget>[
                  SizedBox(
                    height: 30.0 * ScreenRatio.heightRatio,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                        EdgeInsets.only(left: 30 * ScreenRatio.widthRatio),
                        child: CustomText(
                          customText: "Create an Account",
                          textColor: Colors.amber,
                          fontSize: 28 * ScreenRatio.widthRatio,
                          align: TextAlign.left,
                        ),
                      )),
                  Divider(
                    thickness: 5.0 * ScreenRatio.heightRatio,
                    color: Colors.red,
                    indent: 30 * ScreenRatio.widthRatio,
                    endIndent: 312 * ScreenRatio.widthRatio,
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30 * ScreenRatio.heightRatio),
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 30.0 * ScreenRatio.heightRatio,
                        ),
                        CustomTextField(
                          style: TextStyle(color: Colors.black),
                          controller: namecontroller,
                          keyboardType: TextInputType.text,
                          onSaved: (v) {
                            print(v);
                          },
                          labelText: "Name",
                          width: 315 * ScreenRatio.widthRatio,
                          height: 50 * ScreenRatio.heightRatio,
                          validatorFunction: (value) {
                            if (value.isEmpty) {
                              return "Please enter some text";
                            }
                            var message = (!isAlpha(value.toString()))
                                ? "Enter a valid name"
                                : null;
                            return message;
                          },
                          icon: Icon(Icons.person_outline),
                        ),
                        SizedBox(
                          height: 30.0 * ScreenRatio.heightRatio,
                        ),
                        CustomTextField(
                          style: TextStyle(color: Colors.black),
                          controller: emailcontroller,
                          keyboardType: TextInputType.text,
                          onSaved: (v) {
                            print(v);
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
                            return message;
                          },
                        ),
                        SizedBox(
                          height: 30.0 * ScreenRatio.heightRatio,
                        ),
                        CustomTextField(
                            style: TextStyle(color: Colors.black),
                            controller: phonecontroller,
                            keyboardType: TextInputType.text,
                            onSaved: (v) {
                              print(v);
                            },
                            labelText: "Phone",
                            width: 315 * ScreenRatio.widthRatio,
                            height: 50 * ScreenRatio.heightRatio,
                            validatorFunction: (value) {
                              if (value.isEmpty) {
                                return "Please enter some text";
                              }
                              var message = (!isNumeric(value.toString()))
                                  ? "Enter a valid mobile number"
                                  : null;
                              return message;
                            },
                            icon: Icon(Icons.phone_android)),
                        SizedBox(
                          height: 30.0 * ScreenRatio.heightRatio,
                        ),
                        CustomTextField(
                          style: TextStyle(color: Colors.black),
                          controller: passwordcontroller,
                          keyboardType: TextInputType.text,
                          onSaved: (v) {
                            print(v);
                          },
                          labelText: "Password",
                          obscureText: true,
                          width: 315 * ScreenRatio.widthRatio,
                          height: 50 * ScreenRatio.heightRatio,
                          icon: SvgPicture.asset(
                            'assets/icons/email.svg',
                            height: 24 * ScreenRatio.heightRatio,
                          ),
                          validatorFunction: (value) {
                            if (value.isEmpty) {
                              return "Please enter some text";
                            }
                            var message = (!isAlphanumeric(value.toString()))
                                ? "Enter a valid password"
                                : null;
                            return message;
                          },
                        ),
                        SizedBox(
                          height: 30.0 * ScreenRatio.heightRatio,
                        ),
                        SignInButton(
                          bgColor: Colors.amber ,
                          onTapFunction: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.of(context).pushNamed("/logInScreen");
                            }
                          },
                          width: 315 * ScreenRatio.widthRatio,
                          buttonText: "SIGN UP",
                          height: 50.0 * ScreenRatio.heightRatio,
                          textColor: Colors.white,
                          textFontSize: 20.0 * ScreenRatio.widthRatio,
                        ),
                        SizedBox(
                          height: 30.0 * ScreenRatio.heightRatio,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Terms of Use",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 13 * ScreenRatio.heightRatio),
                              ),
                              SizedBox(
                                width: 30.0 * ScreenRatio.widthRatio,
                              ),

                              Text(
                                "Privacy Policy",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 13 * ScreenRatio.heightRatio),
                              ),
                            ])
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
