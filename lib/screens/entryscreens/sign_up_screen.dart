import 'package:flutter/material.dart';
import 'package:tanghit/screens/entryscreens/login_screen.dart';
import 'package:tanghit/utils/custom_text_field.dart';
import 'package:tanghit/utils/form_screen.dart';
import 'package:tanghit/widgets/appButton/sign_in_button.dart';
import 'package:validators/validators.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FormScreen(title: 'Sign Up', formKey: _formKey, children: <Widget>[
      const NameTextField(),
      const SizedBox(height: 30.0),
      EmailTextField(),
      const SizedBox(height: 30.0),
      const PhoneTextField(),
      const SizedBox(height: 30.0),
      const PasswordTextField(),
      const SizedBox(height: 30.0),
      SignUpButton(formKey: _formKey),
      const SizedBox(height: 30.0),
      const TermsOfUseRow()
    ]);
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
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
        }
      },
      buttonText: 'SIGN UP',
      textColor: Colors.white,
      textFontSize: 20.0,
    );
  }
}

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        onSaved: (v) {},
        labelText: 'Phone',
        validatorFunction: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return (!isNumeric(value.toString()))
              ? 'Enter a valid mobile number'
              : null;
        },
        icon: Icon(Icons.phone_android));
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.text,
      onSaved: (v) {},
      labelText: 'Name',
      validatorFunction: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return (!isAlpha(value.toString())) ? 'Enter a valid name' : null;
      },
      icon: Icon(Icons.person_outline),
    );
  }
}
