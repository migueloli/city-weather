import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/repositories/city_repository.dart';
import 'package:city_weather/domain/usecases/usecase.dart';

class GetCitiesUseCase implements UseCase<List<City>, NoParams> {
  final CityRepository _repository;

  GetCitiesUseCase(this._repository);

  @override
  Future<List<City>> call(NoParams params) {
    return _repository.getCities();
  }
} 