import 'package:city_weather/core/error/network_exception.dart';
import 'package:city_weather/core/network/network_info.dart';
import 'package:city_weather/data/datasources/weather_data_source.dart';
import 'package:city_weather/data/extensions/weather_extension.dart';
import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/entities/forecast.dart';
import 'package:city_weather/domain/entities/weather.dart';
import 'package:city_weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl({
    required WeatherDataSource dataSource,
    required NetworkInfo networkInfo,
  })  : _dataSource = dataSource,
        _networkInfo = networkInfo;

  final WeatherDataSource _dataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Weather> getCurrentWeather(City city) async {
    if (!await _networkInfo.isConnected) throw const NetworkException();

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
    if (!await _networkInfo.isConnected) throw const NetworkException();

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
