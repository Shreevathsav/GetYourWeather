import 'package:getyourweather/services/networking.dart';
import 'package:getyourweather/services/location.dart';

const apiKey = 'ba8f3cf352d2e00a2527efd4567e51f5';
const openUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkingClass networkingClass =
        NetworkingClass('$openUrl?q=$cityName&appid=$apiKey&units=metric');
    var data = await networkingClass.getData();
    return data;
  }

  Future<dynamic> getWeather() async {
    Locator location = new Locator();
    await location.getCurrentloctaion();
    NetworkingClass networkingClass = NetworkingClass(
        '$openUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherdata = await networkingClass.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
