import 'package:city_weather/data/datasources/city_data_source.dart';
import 'package:city_weather/domain/entities/city.dart';

class CityMemoryDataSource implements CityDataSource {
  final List<City> _cities = const [
    City(
      cityName: 'Silverstone',
      countryName: 'United Kingdom',
      countryCode: 'GB',
    ),
    City(
      cityName: 'São Paulo',
      countryName: 'Brazil',
      countryCode: 'BR',
    ),
    City(
      cityName: 'Melbourne',
      countryName: 'Australia',
      countryCode: 'AU',
    ),
    City(
      cityName: 'Monte Carlo',
      countryName: 'Monaco',
      countryCode: 'MC',
    ),
  ];

  @override
  Future<List<City>> getCities() => Future.value(_cities);
} 