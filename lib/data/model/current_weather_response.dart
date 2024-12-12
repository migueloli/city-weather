import 'package:city_weather/data/model/clouds.dart';
import 'package:city_weather/data/model/coordinates.dart';
import 'package:city_weather/data/model/main_weather.dart';
import 'package:city_weather/data/model/rain.dart';
import 'package:city_weather/data/model/system.dart';
import 'package:city_weather/data/model/weather.dart';
import 'package:city_weather/data/model/wind.dart';

class CurrentWeatherResponse {
  final Coordinates coord;
  final List<Weather> weather;
  final String base;
  final MainWeather main;
  final int visibility;
  final Wind wind;
  final Rain? rain;
  final Clouds clouds;
  final int dt;
  final System sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  CurrentWeatherResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory CurrentWeatherResponse.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherResponse(
      coord: Coordinates.fromJson(json['coord']),
      weather: (json['weather'] as List)
          .map((w) => Weather.fromJson(w))
          .toList(),
      base: json['base'] ?? '',
      main: MainWeather.fromJson(json['main']),
      visibility: json['visibility'] ?? 0,
      wind: Wind.fromJson(json['wind']),
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'] ?? 0,
      sys: System.fromJson(json['sys']),
      timezone: json['timezone'] ?? 0,
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      cod: json['cod'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'coord': coord.toJson(),
    'weather': weather.map((w) => w.toJson()).toList(),
    'base': base,
    'main': main.toJson(),
    'visibility': visibility,
    'wind': wind.toJson(),
    if (rain != null) 'rain': rain!.toJson(),
    'clouds': clouds.toJson(),
    'dt': dt,
    'sys': sys.toJson(),
    'timezone': timezone,
    'id': id,
    'name': name,
    'cod': cod,
  };
} 