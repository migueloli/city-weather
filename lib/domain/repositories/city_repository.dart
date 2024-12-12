import 'package:city_weather/domain/entities/city.dart';

abstract class CityRepository {
  Future<List<City>> getCities();
} 