
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: [
            ListTile(
                title: Text("Support Center")
            ),
            InkWell(
              child: ListTile(
                leading: Icon(Icons.call),
                title: Text("Call: (714) 253 2851")
              )
            ),
            InkWell(
              child: ListTile(
                leading: Icon(Icons.mail),
                title: Text("Email: support@tanghit.com")
              )
            ),
          ]
        )
    );
  }
}