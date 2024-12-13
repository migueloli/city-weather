import 'package:city_weather/data/datasources/city_data_source.dart';
import 'package:city_weather/data/extensions/city_extension.dart';
import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/repositories/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  const CityRepositoryImpl({
    required CityDataSource dataSource,
  }) : _dataSource = dataSource;

  final CityDataSource _dataSource;

  @override
  Future<List<City>> getCities() async {
    final cityModels = await _dataSource.getCities();
    return cityModels.map((model) => model.toDomain()).toList();
  }
}
