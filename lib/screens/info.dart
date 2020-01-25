import 'package:flutter/material.dart';
import 'package:tanghit/widgets/info_sheet.dart';

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
