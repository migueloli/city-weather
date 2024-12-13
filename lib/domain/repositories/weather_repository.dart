import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/entities/forecast.dart';
import 'package:city_weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  const WeatherRepository();

  Future<Weather> getCurrentWeather(City city);
  Future<Forecast> getWeatherForecast(City city);
}
