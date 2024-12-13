import 'package:city_weather/domain/entities/city.dart';

abstract class CityRepository {
  const CityRepository();

  Future<List<City>> getCities();
}
