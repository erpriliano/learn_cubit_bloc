part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded(this.weather);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherLoaded && o.weather == weather; 
  }

  @override
  int get hashCode => weather.hashCode;
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}