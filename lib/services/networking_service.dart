import 'package:geolocator/geolocator.dart';

import 'location_service.dart';
import 'weather_service.dart';

String apiKey = "02cf4841a84e25170a1d7e274c91a907";

class NetworkingService {
  LocationService locService = LocationService();

  Future getWeatherData() async {
    Position position = await locService.getLocation();

//    String weatherUrl =
//        "api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey";
    String weatherUrl =
        "https://samples.openweathermap.org/data/2.5/weather?lat=37.7510&lon=-97.8220&appid=439d4b804bc8187953eb36d2a8c26a02";
    WeatherService weatherService = WeatherService(url: weatherUrl);

    var weatherData = await weatherService.getWeatherInfo();

    return weatherData;
  }
}
