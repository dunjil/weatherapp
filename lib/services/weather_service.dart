import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherService {
  final String url;
  var weatherData;

  WeatherService({this.url});

  Future getWeatherInfo() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      weatherData = jsonDecode(response.body);
      print(weatherData);
      return weatherData;
    } else {
      print(response.statusCode);
    }
  }
}

//  String apiKey = "02cf4841a84e25170a1d7e274c91a907";
//  String url =
//      "api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={your api key}";
//  String weatherUrl =
//      "https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02";
