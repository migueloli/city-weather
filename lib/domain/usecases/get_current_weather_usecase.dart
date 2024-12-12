import 'package:city_weather/data/model/current_weather_response.dart';
import 'package:city_weather/domain/repositories/weather_repository.dart';
import 'package:city_weather/domain/usecases/params/location_params.dart';
import 'package:city_weather/domain/usecases/usecase.dart';

class GetCurrentWeatherUseCase
    implements UseCase<CurrentWeatherResponse, LocationParams> {
  final WeatherRepository _repository;

  GetCurrentWeatherUseCase(this._repository);

  @override
  Future<CurrentWeatherResponse> call(LocationParams params) {
    return _repository.getCurrentWeather(
      params.cityName,
      params.countryCode,
    );
  }
} 