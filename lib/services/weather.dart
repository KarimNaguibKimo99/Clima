import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'cc38cb11a3f46eac44e957bda818e7b9';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
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
      return 'Very Sunny';
    } else if (temp > 15) {
      return 'Sunny';
    } else if (temp > 10) {
      return 'Cloudly';
    } else {
      return 'Rainy';
    }
  }

  String getImage(int temp) {
    if (temp > 25) {
      return 'images/sunny.jpg';
    } else if (temp > 15) {
      return 'images/sunny.jpg';
    } else if (temp > 10) {
      return 'images/cloudly.jpg';
    } else {
      return 'images/rainy.jpg';
    }
  }
}
