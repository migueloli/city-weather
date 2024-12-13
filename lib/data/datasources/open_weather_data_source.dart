import 'package:city_weather/core/network/api_client.dart';
import 'package:city_weather/data/datasources/weather_data_source.dart';
import 'package:city_weather/data/models/current_weather_response.dart';
import 'package:city_weather/data/models/forecast_response.dart';

class OpenWeatherDataSource implements WeatherDataSource {
  const OpenWeatherDataSource({
    required ApiClient apiClient,
    required String apiKey,
  })  : _apiClient = apiClient,
        _apiKey = apiKey;

  final ApiClient _apiClient;
  final String _apiKey;

  @override
  Future<CurrentWeatherResponse> getCurrentWeather(
    String cityName,
    String countryCode,
  ) async {
    final uri = Uri(
      path: 'weather',
      queryParameters: {
        'q': '$cityName,$countryCode',
        'appid': _apiKey,
      },
    );

    final response = await _apiClient.get(uri.toString());
    return CurrentWeatherResponse.fromJson(response);
  }

  @override
  Future<ForecastResponse> getWeatherForecast(
    String cityName,
    String countryCode,
  ) async {
    final uri = Uri(
      path: 'forecast',
      queryParameters: {
        'q': '$cityName,$countryCode',
        'appid': _apiKey,
      },
    );

    final response = await _apiClient.get(uri.toString());
    return ForecastResponse.fromJson(response);
  }
}
