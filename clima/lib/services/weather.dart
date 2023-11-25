import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Future getCityNameW(String city) async {
    NetworkHelper networkHelper = NetworkHelper("$kWeatherMap"
        "q=$city&appid=$kOpenWeatherKey&units=metric");
    return await networkHelper.getData();
  }

  Future getCurrentLocationW() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper("$kWeatherMap"
        "&lat=${location.latitude}&lon=${location.longitude}"
        "&appid=$kOpenWeatherKey&units=metric");
    return await networkHelper.getData();
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
      return " C'est l'heure du 🍦 ";
    } else if (temp > 20) {
      return "C'est l'heure des habits légers 👕";
    } else if (temp < 10) {
      return 'Vous aurez besoin du  🧣 et des  🧤';
    } else {
      return 'Prenez avec vous un  🧥 On ne sait jamais';
    }
  }
}
