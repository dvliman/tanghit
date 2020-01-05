import 'package:flutter/material.dart';
import 'package:tanghit/screens/boutiques.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => new _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: _index != 0,
            child: TickerMode(enabled: _index == 0, child: BoutiquesScreen()),
          ),
          Offstage(
            offstage: _index != 1,
            child: TickerMode(enabled: _index == 1, child: Text("Settings")),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            this._index = index;
          });
        },
        items: <BottomNavigationBarItem>[
          item(Icons.list, "Boutiques"),
          item(Icons.settings, "Settings"),
        ],
      ),
    );
  }

  BottomNavigationBarItem item(IconData iconData, String iconText) {
    return BottomNavigationBarItem(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      icon: Icon(
        iconData,
        size: 30.0,
      ),
      title: Container(
        margin: EdgeInsets.only(top: 2.0),
        child: Text(iconText),
      ),
    );
  }
}
