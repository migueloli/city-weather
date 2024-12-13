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
    double latitude,
    double longitude,
  ) async {
    final uri = Uri(
      path: 'weather',
      queryParameters: {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'appid': _apiKey,
        'units': 'metric',
      },
    );

    final response = await _apiClient.get(uri.toString());
    return CurrentWeatherResponse.fromJson(response);
  }

  @override
  Future<ForecastResponse> getWeatherForecast(
    double latitude,
    double longitude,
  ) async {
    final uri = Uri(
      path: 'forecast',
      queryParameters: {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'appid': _apiKey,
        'units': 'metric',
      },
    );

    final response = await _apiClient.get(uri.toString());
    return ForecastResponse.fromJson(response);
  }
}
