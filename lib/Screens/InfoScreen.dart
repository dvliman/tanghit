import 'package:flutter/material.dart';
import 'package:tanghit/Widgets/InfoSheet.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Info"),
        ),
        body: InfoSheet());
  }
}
