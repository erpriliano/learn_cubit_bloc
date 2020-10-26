import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_cubit/bloc/weather_bloc.dart';
import 'package:weather_app_bloc_cubit/city_input.dart';
import 'package:weather_app_bloc_cubit/cubit/weather_cubit.dart';

class WeatherSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Search - Fake'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(state.message))
              ); 
            }
          },
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(
                child: CityInput(),
              );
            } else if (state is WeatherLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    state.weather.cityName,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    '${state.weather.temperatureCelcius.toStringAsFixed(1)} °C',
                    style: TextStyle(
                      fontSize: 80,
                    ),
                  ),
                  CityInput(),
                ],
              );
            } else {
              return Center(
                child: CityInput(),
              );
            }
          },
        ),
      ),
    );
  }
}