import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/entities/weather.dart';
import 'package:city_weather/domain/repositories/weather_repository.dart';
import 'package:city_weather/domain/usecases/usecase.dart';

class GetCurrentWeatherUseCase implements UseCase<Weather, City> {
  const GetCurrentWeatherUseCase(this._repository);

  final WeatherRepository _repository;

  @override
  Future<Weather> call(City params) {
    return _repository.getCurrentWeather(params);
  }
}
