import 'package:flutter/material.dart';
import 'package:tanghit/services/shared_pref_service.dart';
import 'package:tanghit/widgets/appButton/sign_in_button.dart';
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

  void initialisation() async {
    await SharedPrefService.setSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/wedding2.jpg'))),
          ),
          CustomText(
            customText: 'Tanghit',
            textColor: Colors.black,
            fontSize: 45,
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({
    Key key,
    @required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      bgColor: Colors.orangeAccent,
      onTapFunction: () {
        if (_formKey.currentState.validate()) {
          Scaffold.of(context)
              .showSnackBar(const SnackBar(content: Text('Processing data')));
        } else {
          Scaffold.of(context).showSnackBar(
              const SnackBar(content: Text('Unauthorized access')));
        }
      },
      buttonText: 'SIGN IN',
      textColor: Colors.white,
      textFontSize: 20.0,
    );
  }
}
