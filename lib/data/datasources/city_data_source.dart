import 'package:city_weather/domain/entities/city.dart';

abstract class CityDataSource {
  Future<List<City>> getCities();
}