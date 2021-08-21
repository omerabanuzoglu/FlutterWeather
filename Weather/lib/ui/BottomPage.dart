import 'package:deneme/Model/BottomBarModel.dart';
import 'package:flutter/material.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  _BottomPageState createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: Center(
        child: BottomBarModel.pages.elementAt(_selectedIndex),
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.blueGrey,
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
          icon: Icon(Icons.wb_cloudy_outlined),
          label: "Weather",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_city_outlined),
          label: "Map",
        ),
      ],
    );
  }
}
