import 'package:city_weather/data/model/current_weather_response.dart';
import 'package:city_weather/data/model/forecast_response.dart';

abstract class WeatherRepository {
  Future<CurrentWeatherResponse> getCurrentWeather(double lat, double lon);
  Future<ForecastResponse> getWeatherForecast(double lat, double lon);
} 