import 'package:city_weather/domain/entities/forecast.dart';
import 'package:city_weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  const WeatherRepository();

  Future<Weather> getCurrentWeather(double latitude, double longitude);
  Future<Forecast> getWeatherForecast(double latitude, double longitude);
}
