import 'package:flutter/material.dart';
import 'package:tanghit/screens/boutiques.dart';
import 'package:tanghit/widgets/boutique.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => new _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _index = 0;
  double _iconSize = 30.0;

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
            child: TickerMode(enabled: _index == 1, child: Text("Saved")),
          ),
          Offstage(
              offstage: _index != 2,
              child: TickerMode(enabled: _index == 2, child: Text('Search'))),
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
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).bottomAppBarColor,
            icon: Icon(
              Icons.list,
              size: _iconSize,
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
              Icons.favorite,
              size: _iconSize,
            ),
            title: Container(
              margin: EdgeInsets.only(top: 2.0),
              child: Text(
                'Saved',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).bottomAppBarColor,
            icon: Icon(
              Icons.search,
              size: _iconSize,
            ),
            title: Container(
              margin: EdgeInsets.only(top: 2.0),
              child: Text(
                'Search',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
