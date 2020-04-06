import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tanghit/screens/about_screen.dart';
import 'package:tanghit/screens/home_screen.dart';
import 'package:tanghit/services/screen_ratio.dart';

class TempBottomNavigation extends StatefulWidget {
  @override
  _TempBottomNavigationState createState() => _TempBottomNavigationState();
}

class _TempBottomNavigationState extends State<TempBottomNavigation> {
  List<Widget> _pages = [HomeScreen(), AboutScreen()];

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
                ? Icon(Icons.home, color: Colors.amber)
                : Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Icon(
                    Icons.search,
                    color: Colors.amber,
                  )
                : Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? SvgPicture.asset('assets/logo/bell@3x.png')
                : Icon(
              Icons.add_alert,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Icon(
              Icons.person,
              color: Colors.amber,
            )
                : Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
