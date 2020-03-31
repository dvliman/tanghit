import 'package:flutter/material.dart';
import 'package:tanghit/utils/custom_text.dart';

class FormScreen extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final GlobalKey formKey;

  const FormScreen(
      {Key key, this.title, this.formKey, this.children = const <Widget>[]})
      : super(key: key);

  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Builder(builder: (context) {
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: ListView(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 100.0),
                              FormTitle(title: widget.title,),
                              SizedBox(height: 40.0),
                            ],
                          ),
                          Column(children: widget.children)
                        ],
                      ),
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

class FormTitle extends StatelessWidget {
  const FormTitle({Key key, this.title}) : super(key: key);

  @required final String title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Divider(
        thickness: 5.0,
        color: Colors.red,
        endIndent: 300,
      ),
      Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            customText: title,
            textColor: Colors.teal,
            fontSize: 31,
            align: TextAlign.left,
          )),
    ]);
  }
}