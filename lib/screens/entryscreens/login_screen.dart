import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tanghit/utils/custom_text_field.dart';
import 'package:tanghit/utils/form_screen.dart';
import 'package:tanghit/widgets/appButton/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FormScreen(title: 'Login', formKey: _formKey, children: <Widget>[
      EmailTextField(),
      const SizedBox(height: 30.0),
      const PasswordTextField(),
      const SizedBox(height: 30.0),
      LoginButton(formKey: _formKey),
      const SizedBox(height: 30.0),
      const TermsOfUseRow()
    ]);
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
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

class TermsOfUseRow extends StatelessWidget {
  const TermsOfUseRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 17.5),
        child: Text('Terms of Use',
            style: TextStyle(color: Colors.teal, fontSize: 19)),
      ),
      const SizedBox(height: 17.5),
      Text('Privacy Policy',
          style: TextStyle(color: Colors.teal, fontSize: 19)),
    ]);
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        style: TextStyle(color:  Colors.black),
        keyboardType: TextInputType.text,
        onSaved: (v) {},
        labelText: 'Password',
        obscureText: true,
        icon: Icon(Icons.lock),
        validatorFunction: (value) =>
            value.isEmpty ? 'Please enter some text' : null);
  }
}

class EmailTextField extends StatelessWidget {
  EmailTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        onSaved: (v) {},
        labelText: 'Email',
        icon: Icon(Icons.lock),
        validatorFunction: (input) =>
            !EmailValidator.validate(input) ? 'Not a valid Email' : null);
  }
}
