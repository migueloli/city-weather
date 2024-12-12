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
  Future<CurrentWeatherResponse> getCurrentWeather(double lat, double lon) async {
    try {
      return await _dataSource.getCurrentWeather(lat, lon);
    } catch (e) {
      rethrow; // You might want to transform this into a domain-specific error
    }
  }

  @override
  Future<ForecastResponse> getWeatherForecast(double lat, double lon) async {
    try {
      return await _dataSource.getWeatherForecast(lat, lon);
    } catch (e) {
      rethrow; // You might want to transform this into a domain-specific error
    }
  }
} 