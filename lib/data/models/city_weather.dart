import 'package:city_weather/data/models/coordinates.dart';

class CityWeather {
  const CityWeather({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory CityWeather.fromJson(Map<String, dynamic> json) {
    return CityWeather(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      coord: Coordinates.fromJson(json['coord']),
      country: json['country'] ?? '',
      population: json['population'] ?? 0,
      timezone: json['timezone'] ?? 0,
      sunrise: json['sunrise'] ?? 0,
      sunset: json['sunset'] ?? 0,
    );
  }

  final int id;
  final String name;
  final Coordinates coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'coord': coord.toJson(),
        'country': country,
        'population': population,
        'timezone': timezone,
        'sunrise': sunrise,
        'sunset': sunset,
      };
}
