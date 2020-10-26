import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_cubit/bloc/weather_bloc.dart';
import 'package:weather_app_bloc_cubit/cubit/weather_cubit.dart';

class CityInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityInputName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Enter a city',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
          suffixIcon: Icon(Icons.search)
        ),
      ),
    );
  }

  void submitCityInputName(BuildContext context, String cityName) {
    // final weatherCubit = BlocProvider.of<WeatherCubit>(context);
    // weatherCubit.getWeather(cityName); // if using cubit
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc..add(GetWeather(cityName));
  }
}