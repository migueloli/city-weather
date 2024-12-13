import 'package:city_weather/data/models/current_weather_response.dart';
import 'package:city_weather/data/models/forecast_response.dart';

abstract class WeatherDataSource {
  const WeatherDataSource();

  Future<CurrentWeatherResponse> getCurrentWeather(
    String cityName,
    String countryCode,
  );
  Future<ForecastResponse> getWeatherForecast(
    String cityName,
    String countryCode,
  );
}
