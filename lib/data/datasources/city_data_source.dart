import 'package:city_weather/data/models/city_model.dart';

abstract class CityDataSource {
  const CityDataSource();

  Future<List<CityModel>> getCities();
}
