import 'package:flutter/material.dart';

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
            child: TickerMode(
              enabled: _index == 0,
              child: Text("home")
            ),
          ),
          Offstage(
            offstage: _index != 3,
            child: TickerMode(
              enabled: true,
              child: Text('settings')
            )
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        onTap: (int index) { setState((){ this._index = index; }); },
        selectedItemColor: Theme.of(context).textTheme.headline.color,
        unselectedItemColor: Theme.of(context).textTheme.overline.color,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).bottomAppBarColor,
            icon: Icon(
              Icons.calendar_today,
              size: 20.0,
            ),
            title: Container(
              margin: EdgeInsets.only(top: 2.0),
              child: Text(
                'Boutiques',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).bottomAppBarColor,
            icon: Icon(
              Icons.settings,
              size: 20.0,
            ),
            title: Container(
              margin: EdgeInsets.only(top: 2.0),
              child: Text(
                'Setting',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
