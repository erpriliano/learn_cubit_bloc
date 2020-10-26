import 'package:meta/meta.dart';

class Weather {
  final String cityName;
  final double temperatureCelcius;

  Weather({
    this.cityName,
    this.temperatureCelcius,
  });

  @override
  bool operator ==(Object o) {
    if(identical(this, o)) return true;

    return o is Weather &&
      o.cityName == cityName &&
      o.temperatureCelcius == temperatureCelcius;
  }

  @override
  int get hashCode => cityName.hashCode ^ temperatureCelcius.hashCode;
}