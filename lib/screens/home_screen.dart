import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanghit/widgets/cards/card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var container = Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          DashboardCard(),
          SizedBox(height: 20),
          DashboardCard()
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(
                child: container,
                navigationBar: CupertinoNavigationBar(middle: Text("Tanghit")));
          })
        : Scaffold(body: container);
  }
}
