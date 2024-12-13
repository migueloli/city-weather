import 'package:city_weather/domain/entities/weather.dart';
import 'package:city_weather/domain/entities/forecast.dart';
import 'package:city_weather/domain/entities/city.dart';

abstract class WeatherRepository {
  Future<Weather> getCurrentWeather(City city);
  Future<Forecast> getWeatherForecast(City city);
} 