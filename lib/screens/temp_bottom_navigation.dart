import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanghit/screens/about_screen.dart';
import 'package:tanghit/screens/home_screen.dart';

class TempBottomNavigation extends StatefulWidget {
  @override
  _TempBottomNavigationState createState() => _TempBottomNavigationState();
}

class _TempBottomNavigationState extends State<TempBottomNavigation> {
  List<NavigationItem> navItems;

  List<Widget> _pages = [
    HomeScreen(),
    AboutScreen(),
    HomeScreen(),
    AboutScreen()
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    navItems = [
      NavigationItem(Icon(Icons.home), 'Home'),
      NavigationItem(Icon(Icons.search), 'Search'),
      NavigationItem(
          ImageIcon(AssetImage('assets/logo/bell.png')), 'Notification'),
      NavigationItem(Icon(Icons.person), 'About'),
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var navigationBar = Platform.isIOS
        ? CupertinoTabBar(
            items: navItems.map((e) => e.item()).toList(),
            currentIndex: _selectedIndex,
            activeColor: Colors.black,
            backgroundColor: Colors.white,
            onTap: _onItemTapped,
          )
        : BottomNavigationBar(
            items: navItems.map((e) => e.item()).toList(),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          );

    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: navigationBar,
            tabBuilder: (BuildContext context, int i) {
              switch (i) {
                case 0:
                  return HomeScreen();
                case 1:
                  return AboutScreen();
                case 2:
                  return HomeScreen();
                case 3:
                  return AboutScreen();
                default:
                  return HomeScreen();
              }
            })
        : Scaffold(
            body: _pages[_selectedIndex],
            bottomNavigationBar: navigationBar,
          );
  }
}

class NavigationItem {
  NavigationItem(this.icon, this.title);

  Widget icon;
  @required
  String title;

  BottomNavigationBarItem item() {
    return BottomNavigationBarItem(icon: icon, title: Text(title));
  }
}
