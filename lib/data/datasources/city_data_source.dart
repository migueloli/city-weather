import 'package:city_weather/data/models/city_model.dart';

abstract class CityDataSource {
  Future<List<CityModel>> getCities();
}