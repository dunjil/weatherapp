import 'package:flutter/material.dart';
import 'package:weatherapp/screens/home_screen.dart';
import 'package:weatherapp/services/networking_service.dart';
import 'package:weatherapp/services/weather_service.dart';
import '../services/location_service.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
 ? NetworkingService networkingService = NetworkingService();

  getWeatherData() async {
    var weatherInfo = await networkingService.getWeatherData();
    //print(weatherData);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(weatherData: weatherInfo);
    }));
  }

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    getWeatherData();
    return Container(
      child: Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 3.0,
      )),
    );
  }
}
