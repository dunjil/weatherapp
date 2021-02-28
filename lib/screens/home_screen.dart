import 'package:flutter/material.dart';
import 'package:weatherapp/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weatherapp/services/networking_service.dart';

class HomeScreen extends StatefulWidget {
  var weatherData;
  HomeScreen({this.weatherData});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName;
  String weatherDesc;
  double temp;
  var weatherData;

  setWeatherData() {
    weatherData = widget.weatherData;
  }

  @override
  initState() {
    setWeatherData();
    super.initState();
  }

  refreshPage() async {
    NetworkingService networkingService = NetworkingService();
    var weatherInfo = await networkingService.getWeatherData();
    setState(() {
      weatherData = weatherInfo;
      updateUi();
    });
  }

  updateUi() {
    if (weatherData == null) {
      cityName = "";
      weatherDesc = "Error";
      temp = 0;
      return;
    }
    cityName = weatherData["name"];
    temp = weatherData["main"]["temp"];
    weatherDesc = weatherData["weather"][0]["description"];
  }

  @override
  Widget build(BuildContext context) {
    updateUi();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: OurClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 18.0,
                        top: 12,
                        bottom: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "DevClass",
                            style: title,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.white70,
                              size: 20.0,
                            ),
                            Text(
                              cityName,
                              style: title.copyWith(color: Colors.white60),
                            )
                          ],
                        ),
                        Text(
                          "${(temp - 273.15).round()}",
                          style: tempText,
                        ),
                        Stack(
                          children: <Widget>[
                            Positioned(
                              top: -5,
                              right: -10,
                              child: Icon(
                                //MdiIcons.weatherPartlyCloudy,
                                Icons.wb_sunny,
                                color: Color(0XFFFFE34F),
                                size: 70,
                              ),
                            ),
                            Icon(
                              //MdiIcons.weatherPartlyCloudy,
                              Icons.cloud,
                              color: Colors.white,
                              size: 100,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            weatherDesc,
                            style: subTitle.copyWith(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OurClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height - 60, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height + 15, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
