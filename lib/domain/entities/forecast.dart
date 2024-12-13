import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/entities/weather.dart';

class Forecast {
  const Forecast({
    required this.hourlyForecast,
    required this.city,
  });

  final List<Weather> hourlyForecast;
  final City city;
}
