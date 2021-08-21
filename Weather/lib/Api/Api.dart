class Api {
  String url = "http://api.weatherstack.com";
  String apiKey = "1f8a366a9e61c9755fec5decc360bc71";

  dynamic whichCity(String city) {
    return "$url/current?access_key=$apiKey&query=$city";
  }
}
