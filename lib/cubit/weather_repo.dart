import 'dart:math';

import 'package:flutter_june2022/cubit/weather_model.dart';


extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

abstract class WeatherRepository {
  /// Throws [NetworkException].
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
          () {
        final random = Random();
        if (random.nextBool()) { // Simulate some network exception
          throw NetworkException();
        }
        return Weather( cityName: cityName,      // Return "fetched" weather
          // Temperature between 20 and 35.99
          temperatureCelsius: 20 + random.nextInt(15) + random.nextDouble().toPrecision(3),
        );
      },
    );
  }
}

class NetworkException implements Exception {}