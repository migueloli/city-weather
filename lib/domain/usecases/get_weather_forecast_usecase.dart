import 'package:city_weather/domain/entities/forecast.dart';
import 'package:city_weather/domain/repositories/weather_repository.dart';
import 'package:city_weather/domain/usecases/params/location_params.dart';
import 'package:city_weather/domain/usecases/usecase.dart';

class GetWeatherForecastUseCase implements UseCase<Forecast, LocationParams> {
  const GetWeatherForecastUseCase(this._repository);

  final WeatherRepository _repository;

  @override
  Future<Forecast> call(LocationParams params) {
    return _repository.getWeatherForecast(params.latitude, params.longitude);
  }
}
