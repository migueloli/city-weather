import 'package:city_weather/domain/entities/forecast.dart';
import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/repositories/weather_repository.dart';
import 'package:city_weather/domain/usecases/usecase.dart';

class GetWeatherForecastUseCase implements UseCase<Forecast, City> {
  final WeatherRepository _repository;

  GetWeatherForecastUseCase(this._repository);

  @override
  Future<Forecast> call(City params) {
    return _repository.getWeatherForecast(params);
  }
} 