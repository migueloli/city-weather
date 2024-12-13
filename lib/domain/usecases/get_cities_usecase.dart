import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/repositories/city_repository.dart';
import 'package:city_weather/domain/usecases/usecase.dart';

class GetCitiesUseCase implements UseCase<List<City>, NoParams> {
  const GetCitiesUseCase(this._repository);

  final CityRepository _repository;

  @override
  Future<List<City>> call(NoParams params) {
    return _repository.getCities();
  }
}
