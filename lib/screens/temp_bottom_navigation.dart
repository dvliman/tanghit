import 'package:flutter/material.dart';
import 'package:tanghit/screens/about_screen.dart';
import 'package:tanghit/screens/home_screen.dart';

class TempBottomNavigation extends StatefulWidget {
  @override
  _TempBottomNavigationState createState() => _TempBottomNavigationState();
}

class _TempBottomNavigationState extends State<TempBottomNavigation> {
  final List<Widget> _pages = [HomeScreen(), AboutScreen()];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Icon(Icons.list, color: Colors.amber)
                : Icon(
                    Icons.list,
                    color: Colors.grey,
                  ),
            title: _selectedIndex == 0
                ? Text(
                    'Homepage',
                    style: TextStyle(
                      fontFamily: 'Gotham-Bold',
                      fontSize: 15,
                      color: Color.fromARGB(255, 40, 47, 108),
                    ),
                  )
                : Text(
                    'home',
                    style: TextStyle(
                      fontFamily: 'Gotham-Book',
                      fontSize: 10,
                    ),
                  ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Icon(
                    Icons.account_box,
                    color: Colors.amber,
                  )
                : Icon(
                    Icons.account_box,
                    color: Colors.grey,
                  ),
            title: _selectedIndex == 1
                ? Text(
                    'Search',
                    style: TextStyle(
                      fontFamily: 'Gotham-Bold',
                      fontSize: 15,
                      color: Color.fromARGB(255, 40, 47, 108),
                    ),
                  )
                : Text(
                    'search',
                    style: TextStyle(
                      fontFamily: 'Gotham-Book',
                      fontSize: 10,
                    ),
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
