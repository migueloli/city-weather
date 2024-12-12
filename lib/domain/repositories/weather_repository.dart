import 'package:city_weather/data/model/current_weather_response.dart';
import 'package:city_weather/data/model/forecast_response.dart';

abstract class WeatherRepository {
  Future<CurrentWeatherResponse> getCurrentWeather(String cityName, String countryCode);
  Future<ForecastResponse> getWeatherForecast(String cityName, String countryCode);
} 