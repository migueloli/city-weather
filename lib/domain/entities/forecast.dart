import 'package:city_weather/domain/entities/weather.dart';
import 'package:city_weather/domain/entities/city.dart';

class Forecast {
  final List<Weather> hourlyForecast;
  final City city;

  const Forecast({
    required this.hourlyForecast,
    required this.city,
  });
} 