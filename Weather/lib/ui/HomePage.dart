import 'package:deneme/Service/WeatherService.dart';
import 'package:deneme/Widget/BottomNavigationBar.dart';
import 'package:deneme/Widget/Widgets.dart';
import 'package:deneme/ui/WeatherScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherService _weatherService = WeatherService();
  String dropdownValue = 'Ankara';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: dropDownButton(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: Colors.white),
              ),
            ),
            bottomSpace,
          ],
        ),
      ),
    );
  }

  DropdownButton<String> dropDownButton() {
    return DropdownButton(
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.white,
      ),
      iconSize: 24,
      elevation: 16,
      dropdownColor: Colors.blue,
      style: const TextStyle(color: Colors.white),
      underline: Container(height: 0),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          _weatherService.getData(dropdownValue);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WeatherScreen(city: dropdownValue)),
          );
        });
      },
      items: Widgets.cities.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: GoogleFonts.acme(fontSize: 17),
          ),
        );
      }).toList(),
    );
  }
}
