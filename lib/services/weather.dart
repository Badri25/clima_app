import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';

const apiKey = '28be05b3f7308db6961ddfae73470f57';
const openWeatherMapUrl ='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = new NetworkHelper
      ('$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather () async {
    Location loc = new Location();
    await loc.getCurrentLocation();

    NetworkHelper networkHelper = new NetworkHelper('$openWeatherMapUrl?lat=${loc
        .latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
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
