import 'package:city_weather/data/datasources/city_data_source.dart';
import 'package:city_weather/data/models/city_model.dart';

class CityMemoryDataSource implements CityDataSource {
  const CityMemoryDataSource();

  final List<CityModel> _cities = const [
    CityModel(
      cityName: 'Silverstone',
      countryName: 'United Kingdom',
      countryCode: 'GB',
      latitude: 52.0733,
      longitude: -1.0147,
    ),
    CityModel(
      cityName: 'São Paulo',
      countryName: 'Brazil',
      countryCode: 'BR',
      latitude: -23.5505,
      longitude: -46.6333,
    ),
    CityModel(
      cityName: 'Melbourne',
      countryName: 'Australia',
      countryCode: 'AU',
      latitude: -37.8136,
      longitude: 144.9631,
    ),
    CityModel(
      cityName: 'Monte Carlo',
      countryName: 'Monaco',
      countryCode: 'MC',
      latitude: 43.7384,
      longitude: 7.4246,
    ),
  ];

  @override
  Future<List<CityModel>> getCities() => Future.value(_cities);
}
