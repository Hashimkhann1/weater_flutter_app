import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart'; //file
import 'package:weather_app/services/networking.dart'; //file
import 'location_screens.dart'; //file
import 'package:flutter_spinkit/flutter_spinkit.dart'; //spinkit


var apiKey = '73cf961a8f2c2c7965406ef8886b27e0';

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

  void getLocationData() async {
    Location location = Location();
   await location.getCurrentLocation();
   
   NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longtude}&appid=$apiKey&units=metric');
   var WeatherData = await networkHelper.getData();

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
