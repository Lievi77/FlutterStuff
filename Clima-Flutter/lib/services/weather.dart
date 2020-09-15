import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = '593009c8f2866a6c94629d83cfba1330';

const weatherLink = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
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

  Future<dynamic> getLocationWeather() async {
    Location myLocation = Location();

    await myLocation.getCurrentLocation();

    String url =
        '$weatherLink?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apiKey&units=metric';

    NetworkHelper helper = NetworkHelper(url: url);

    var weatherData = await helper.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$weatherLink?q=$cityName&appid=$apiKey&units=metric';

    NetworkHelper helper = NetworkHelper(url: url);

    var weatherData = await helper.getData();
    return weatherData;
  }
}
