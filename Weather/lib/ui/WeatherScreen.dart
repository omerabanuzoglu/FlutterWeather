import 'package:deneme/Model/Model.dart';
import 'package:deneme/Service/WeatherService.dart';
import 'package:deneme/Widget/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherScreen extends StatefulWidget {
  final String city;
  const WeatherScreen({Key? key, required this.city}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherService _weatherService = WeatherService();
  Widgets _widgets = Widgets();
  Future<Weather>? _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = _weatherService.getData(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 10,
        centerTitle: true,
        title: Text(
          "${widget.city} Hava Durumu",
          style: GoogleFonts.acme(color: Colors.black),
        ),
      ),
      body: Center(
        child: FutureBuilder<Weather>(
          future: _futureData,
          builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 300,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      child: Image.network(
                        _widgets.cut(
                          data!.current.weatherIcons.toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Sıcaklık:  ${data.current.temperature.toString()}",
                      style: GoogleFonts.acme(
                        fontSize: 20,
                      ),
                    ),
                    line,
                    Text(
                      "Nem Oranı:  ${data.current.humidity.toString()}",
                      style: GoogleFonts.acme(
                        fontSize: 20,
                      ),
                    ),
                    line,
                    Text(
                      "Hissedilen Sıcaklık:  ${data.current.feelslike.toString()}",
                      style: GoogleFonts.acme(
                        fontSize: 20,
                      ),
                    ),
                    line,
                    Text(
                      "Gözlem Tarihi:  ${_widgets.substringLocalTime(data.location.localtime)}",
                      style: GoogleFonts.acme(
                        fontSize: 20,
                      ),
                    ),
                    line,
                    Text(
                      "Gözlem Zamanı:  ${_widgets.substringTime(data.current.observationTime)}",
                      style: GoogleFonts.acme(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      _widgets.whatColor(_widgets.cut(
                        data.current.weatherDescriptions.toString(),
                      )),
                      Colors.white,
                    ],
                    stops: [
                      0.2,
                      0.5,
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
