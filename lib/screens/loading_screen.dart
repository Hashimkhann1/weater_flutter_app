import 'package:flutter/material.dart';
import 'location_screens.dart'; //file
import 'package:weather_app/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; //spinkit

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<dynamic> getLocationData() async {
    var WeatherData = await WeatherModel().getLocationWeather();

   Navigator.push(context, MaterialPageRoute(builder: (context) {
     return LocationScreen(locationWeather: WeatherData);
   }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
