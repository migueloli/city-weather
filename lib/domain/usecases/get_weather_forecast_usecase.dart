import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/entities/forecast.dart';
import 'package:city_weather/domain/repositories/weather_repository.dart';
import 'package:city_weather/domain/usecases/usecase.dart';

class GetWeatherForecastUseCase implements UseCase<Forecast, City> {
  const GetWeatherForecastUseCase(this._repository);

  final WeatherRepository _repository;

  @override
  Future<Forecast> call(City params) {
    return _repository.getWeatherForecast(params.latitude, params.longitude);
  }
}
