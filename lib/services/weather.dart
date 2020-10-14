import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'e766292d863161a9946e81bc64b11a06';
const openWeatherAddress = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCity(String cityName) async {
    String url = '$openWeatherAddress?q=$cityName&appid=$apiKey&units=metric';
    Networker networker = Networker(url);
    var weatherData = await networker.getData();
    return weatherData;
  }

  Future<dynamic> getLocation() async {
    Location location = Location();
    await location.getLocation();
    Networker networker = Networker(
        '$openWeatherAddress?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networker.getData();
    return weatherData;
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
    if (temp > 25) {
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
