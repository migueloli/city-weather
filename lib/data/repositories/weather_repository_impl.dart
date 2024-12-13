import 'package:city_weather/data/datasources/weather_data_source.dart';
import 'package:city_weather/domain/entities/weather.dart';
import 'package:city_weather/domain/entities/forecast.dart';
import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/repositories/weather_repository.dart';
import 'package:city_weather/data/extensions/weather_extension.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource _dataSource;

  WeatherRepositoryImpl({required WeatherDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Weather> getCurrentWeather(City city) async {
    try {
      final response = await _dataSource.getCurrentWeather(
        city.cityName,
        city.countryCode,
      );
      return response.toDomain();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Forecast> getWeatherForecast(City city) async {
    try {
      final response = await _dataSource.getWeatherForecast(
        city.cityName,
        city.countryCode,
      );
      return response.toDomain();
    } catch (e) {
      rethrow;
    }
  }
} 