import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();

    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
   await location.getCurrentLocation();
   print(location.longtude);
   print(location.latitude);
   
  }
  
  void getData() async {
    try{
      http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=73cf961a8f2c2c7965406ef8886b27e0'));
      print(response.body);
      String data = response.body;
      print(response.statusCode);

      var lontitude = jsonDecode(data)['coord']['lon'];
      print(lontitude);
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
