import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:tanghit/screens/boutiques.dart';
import 'package:tanghit/screens/settings.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.news),
          title: Text('Boutiques'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings),
          title: Text('Settings'),
        ),
      ]),
      tabBuilder: (context, index) {
        return (index == 0) ?
          BoutiquesScreen() :
          SettingsScreen();
      },
    );
  }
}