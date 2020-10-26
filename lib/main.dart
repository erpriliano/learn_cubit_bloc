import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_cubit/bloc/weather_bloc.dart';
import 'package:weather_app_bloc_cubit/cubit/weather_cubit.dart';
import 'package:weather_app_bloc_cubit/data/weather_repository.dart';
import 'package:weather_app_bloc_cubit/weather_search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Bloc - Cubit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        // create: (context) => WeatherCubit(FakeWeather()), //if using Cubit
        create: (context) => WeatherBloc(FakeWeather()),
        child: WeatherSearchPage(),
      ),
    );
  }
}