
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_june2022/cubit/weather_cubit.dart';
import 'package:flutter_june2022/cubit/weather_model.dart';
import 'package:flutter_june2022/cubit/weather_state.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,

          child: BlocConsumer<WeatherCubit, WeatherState>(
            listener: (BuildContext context, state) {
              if(state is WeatherError){
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );            }
            },
            builder: (BuildContext context, Object? state) {
              if(state is WeatherInitial){
                return blocInitialWidget(context);
              } else if(state is WeatherLoading){
                return const CircularProgressIndicator();
              } else if(state is WeatherLoaded){
                return columnData(context, state.weather);
              }
              else{
                return blocInitialWidget(context);
              }

            },),
        ),
      ),
    );
  }

  Widget blocInitialWidget(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child:TextField(
        onSubmitted: (value)=>submitCityName(context,value),
        textInputAction: TextInputAction.search,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            hintText: "Enter city",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            suffixIcon: const Icon(Icons.search)
        ),
      )
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    final weatherCubit = context.read<WeatherCubit>();
    weatherCubit.getWeather(cityName);
  }

  Widget columnData(context, Weather weather) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(weather.cityName.toString(),style: TextStyle(fontSize: 30,color: Colors.blue),),
              SizedBox(height: 30,),
              Text(weather.temperatureCelsius.toString(),style: TextStyle(fontSize: 30,color: Colors.red),),
              SizedBox(height: 30,),
              TextField(
                onSubmitted: (value)=>submitCityName(context,value),
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: "Enter city",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  suffixIcon: Icon(Icons.search)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

