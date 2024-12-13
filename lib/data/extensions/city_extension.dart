import 'package:city_weather/data/models/city_model.dart';
import 'package:city_weather/domain/entities/city.dart';

extension CityModelExtension on CityModel {
  City toDomain() => City(
        cityName: cityName,
        countryName: countryName,
        countryCode: countryCode,
        latitude: latitude,
        longitude: longitude,
      );
}
