import 'package:flutter/material.dart';
import 'package:tanghit/widgets/cards/card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            DashboardCard(),
            SizedBox(
              height: 20,
            ),
            DashboardCard()
          ],
        ),
      ),
    );
  }
}
