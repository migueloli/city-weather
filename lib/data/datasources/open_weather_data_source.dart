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
  Future<CurrentWeatherResponse> getCurrentWeather(double lat, double lon) async {
    final response = await _apiClient.get('/weather', headers: {
      'params': {
        'lat': lat.toString(),
        'lon': lon.toString(),
        'appid': _apiKey,
      }.toString(),
    });

    return CurrentWeatherResponse.fromJson(response);
  }

  @override
  Future<ForecastResponse> getWeatherForecast(double lat, double lon) async {
    final response = await _apiClient.get('/forecast', headers: {
      'params': {
        'lat': lat.toString(),
        'lon': lon.toString(),
        'appid': _apiKey,
      }.toString(),
    });

    return ForecastResponse.fromJson(response);
  }
}