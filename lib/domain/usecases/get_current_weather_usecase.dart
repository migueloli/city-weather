import 'package:city_weather/domain/entities/weather.dart';
import 'package:city_weather/domain/repositories/weather_repository.dart';
import 'package:city_weather/domain/usecases/params/location_params.dart';
import 'package:city_weather/domain/usecases/usecase.dart';

class GetCurrentWeatherUseCase implements UseCase<Weather, LocationParams> {
  const GetCurrentWeatherUseCase(this._repository);

  final WeatherRepository _repository;

  @override
  Future<Weather> call(LocationParams params) {
    return _repository.getCurrentWeather(params.latitude, params.longitude);
  }
}
