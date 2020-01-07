
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
                title: Text("About us")
            ),
            SwitchListTile.adaptive(
              activeColor: Theme.of(context).colorScheme.secondary,
              title: Text('Use location'),
              subtitle: Text('Positions will be filtered by the your location.'),
              value: false, onChanged: (bool value) {},
            ),
          ]
        )
    );
  }
}