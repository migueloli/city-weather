import 'package:city_weather/data/model/forecast_response.dart';
import 'package:city_weather/domain/repositories/weather_repository.dart';
import 'package:city_weather/domain/usecases/params/location_params.dart';
import 'package:city_weather/domain/usecases/usecase.dart';

class GetWeatherForecastUseCase
    implements UseCase<ForecastResponse, LocationParams> {
  final WeatherRepository _repository;

  GetWeatherForecastUseCase(this._repository);

  @override
  Future<ForecastResponse> call(LocationParams params) {
    return _repository.getWeatherForecast(
      params.latitude,
      params.longitude,
    );
  }
} 