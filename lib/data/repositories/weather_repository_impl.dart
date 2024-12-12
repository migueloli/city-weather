import 'package:city_weather/data/datasources/weather_data_source.dart';
import 'package:city_weather/data/model/current_weather_response.dart';
import 'package:city_weather/data/model/forecast_response.dart';
import 'package:city_weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource _dataSource;

  WeatherRepositoryImpl({
    required WeatherDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<CurrentWeatherResponse> getCurrentWeather(String cityName, String countryCode) async {
    try {
      return await _dataSource.getCurrentWeather(cityName, countryCode);
    } catch (e) {
      rethrow; // You might want to transform this into a domain-specific error
    }
  }

  @override
  Future<ForecastResponse> getWeatherForecast(String cityName, String countryCode) async {
    try {
      return await _dataSource.getWeatherForecast(cityName, countryCode);
    } catch (e) {
      rethrow; // You might want to transform this into a domain-specific error
    }
  }
} 