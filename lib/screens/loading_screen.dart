import 'package:getyourweather/services/weather.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat, long;
  void getCurrentLocation() async {
    var weatherdata = await WeatherModel().getWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        webdata: weatherdata,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitThreeBounce(
        color: Colors.white,
        size: 30.0,
      )),
    );
  }
}
