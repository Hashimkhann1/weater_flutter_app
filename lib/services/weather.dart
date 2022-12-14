import 'package:weather_app/services/location.dart'; //file
import 'package:weather_app/services/networking.dart'; //file

var apiKey = '73cf961a8f2c2c7965406ef8886b27e0';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityName (String cityName) async {
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherDataByCityName = await networkHelper.getData();

    return weatherDataByCityName;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longtude}&appid=$apiKey&units=metric');
    var WeatherData = await networkHelper.getData();
    return WeatherData;

  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
