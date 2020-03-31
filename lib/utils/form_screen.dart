import 'package:flutter/material.dart';
import 'package:tanghit/utils/custom_text.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({
    Key key,
    this.children = const <Widget>[],
    this.formKey,
    this.title,
  }) : super(key: key);

  final String title;
  final List<Widget> children;
  final GlobalKey formKey;

  @override
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
                      padding: const EdgeInsets.all(20),
                      child: ListView(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              const SizedBox(height: 100.0),
                              FormTitle(title: widget.title),
                              const SizedBox(height: 40.0),
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

  @required
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            customText: title,
            textColor: Colors.teal,
            fontSize: 31,
            align: TextAlign.left,
          )),
      const SizedBox(height: 5),
      Align(
        alignment: Alignment.bottomLeft,
        child: const SizedBox(
          width: 60.0,
          height: 5.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
          ),
        ),
      ),
    ]);
  }
}
