import 'package:flutter/material.dart';
import 'package:tanghit/screens/about_screen.dart';
import 'package:tanghit/screens/home_screen.dart';
import 'package:tanghit/services/screen_ratio.dart';

class TempBottomNavigation extends StatefulWidget {
  @override
  _TempBottomNavigationState createState() => _TempBottomNavigationState();
}

class _TempBottomNavigationState extends State<TempBottomNavigation> {
  List<Widget> _pages = [
    HomeScreen(),
    AboutScreen(),
    HomeScreen(),
    AboutScreen()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    ScreenRatio.setScreenRatio(
        currentScreenHeight: screenSize.height,
        currentScreenWidth: screenSize.width);
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Icon(Icons.home, color: Colors.black)
                : Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? Icon(
                      Icons.search,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
              title: Text("Search")),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? Image.asset('assets/logo/bell.png')
                  : Image.asset('assets/logo/bell.png'),
              title: Text("Notification")),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? Icon(
                      Icons.person,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                    ),
              title: Text("About")),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
