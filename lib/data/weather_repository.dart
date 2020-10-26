import 'dart:math';
import 'package:weather_app_bloc_cubit/data/model/weather.dart';

abstract class WeatherRepository {
  //Throws Network Exception
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeather implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName) {
    //Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();

        if(random.nextBool()) {
          throw NetworkException();
        }

        return Weather(
          cityName: cityName,
          temperatureCelcius: 20 + random.nextInt(15) + random.nextDouble()
        );
      }
    );
  }
}

class NetworkException implements Exception {}