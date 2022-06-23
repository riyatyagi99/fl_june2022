
import 'package:equatable/equatable.dart';
import 'package:flutter_june2022/cubit/weather_model.dart';

abstract class WeatherState extends Equatable{
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
  @override
  List<Object?> get props =>[];
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();

  @override
  List<Object?> get props =>[];          //throw UnimplementedError();
}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded(this.weather);

  @override
  List<Object?> get props =>[weather];
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);
  @override
  List<Object?> get props =>[message];
}