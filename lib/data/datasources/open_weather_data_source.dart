import 'package:city_weather/data/datasources/weather_data_source.dart';
import 'package:city_weather/data/model/current_weather_response.dart';
import 'package:city_weather/data/model/forecast_response.dart';
import 'package:city_weather/core/network/api_client.dart';

class OpenWeatherDataSource implements WeatherDataSource {
  final ApiClient _apiClient;
  final String _apiKey;

  OpenWeatherDataSource({
    required ApiClient apiClient,
    required String apiKey,
  })  : _apiClient = apiClient,
        _apiKey = apiKey;

  @override
  Future<CurrentWeatherResponse> getCurrentWeather(String cityName, String countryCode) async {
    final uri = Uri(
      path: 'weather',
      queryParameters: {
        'q': '$cityName,$countryCode',
        'appid': _apiKey,
      }
    );
    
    final response = await _apiClient.get(uri.toString());
    return CurrentWeatherResponse.fromJson(response);
  }

  @override
  Future<ForecastResponse> getWeatherForecast(String cityName, String countryCode) async {
    final uri = Uri(
      path: 'forecast',
      queryParameters: {
        'q': '$cityName,$countryCode',
        'appid': _apiKey,
      }
    );

    final response = await _apiClient.get(uri.toString());
    return ForecastResponse.fromJson(response);
  }
}