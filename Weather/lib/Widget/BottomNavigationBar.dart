import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigationBar() {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    _selectedIndex = index;
  }

  return BottomNavigationBar(
    backgroundColor: Colors.white10,
    mouseCursor: SystemMouseCursors.grab,
    selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 35),
    unselectedItemColor: Colors.white,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    selectedItemColor: Colors.amberAccent,
    elevation: 0,
    currentIndex: _selectedIndex,
    onTap: _onItemTapped,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.location_on),
        label: "Cities",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home_rounded),
        label: "Home",
      ),
    ],
  );
}
