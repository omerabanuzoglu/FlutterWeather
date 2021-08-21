import 'dart:convert';

import 'package:deneme/Api/Api.dart';
import 'package:deneme/Model/Model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Api _api = Api();

  Future<Weather> getData(String city) async {
    var response = await http.get(Uri.parse(_api.whichCity(city)));
    print(response.body);
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Veri Yüklenemedi.");
    }
  }
}
