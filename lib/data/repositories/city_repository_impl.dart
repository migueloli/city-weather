import 'package:city_weather/data/datasources/city_memory_data_source.dart';
import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/repositories/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  final CityMemoryDataSource _memoryDataSource;

  CityRepositoryImpl({
    required CityMemoryDataSource memoryDataSource,
  }) : _memoryDataSource = memoryDataSource;

  @override
  Future<List<City>> getCities() {
    return Future.value(_memoryDataSource.getCities());
  }
} 