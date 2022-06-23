

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_june2022/cubit/weather_repo.dart';
import 'package:flutter_june2022/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherRepository repository;
  WeatherCubit(this.repository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async{
    try {
     emit(WeatherLoading());
     final weather=await repository.fetchWeather(cityName);
     emit(WeatherLoaded(weather));
    } on NetworkException {
  emit(WeatherError("There is some problem right now"));
    }
  }
}