import 'package:flutter/material.dart';
import 'package:weatherapp/screens/loading_screen.dart';
import 'screens/home_screen.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      home: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadingScreen();
    //HomeScreen();
  }
}
