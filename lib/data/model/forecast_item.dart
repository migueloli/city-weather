import 'package:city_weather/data/model/clouds.dart';
import 'package:city_weather/data/model/main_weather.dart';
import 'package:city_weather/data/model/rain.dart';
import 'package:city_weather/data/model/system.dart';
import 'package:city_weather/data/model/weather.dart';
import 'package:city_weather/data/model/wind.dart';

class ForecastItem {
  final int dt;
  final MainWeather main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Rain? rain;
  final System sys;
  final String dtTxt;

  ForecastItem({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    this.rain,
    required this.sys,
    required this.dtTxt,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      dt: json['dt'] ?? 0,
      main: MainWeather.fromJson(json['main']),
      weather: (json['weather'] as List)
          .map((w) => Weather.fromJson(w))
          .toList(),
      clouds: Clouds.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'] ?? 0,
      pop: json['pop']?.toDouble() ?? 0.0,
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      sys: System.fromJson(json['sys']),
      dtTxt: json['dt_txt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'dt': dt,
    'main': main.toJson(),
    'weather': weather.map((w) => w.toJson()).toList(),
    'clouds': clouds.toJson(),
    'wind': wind.toJson(),
    'visibility': visibility,
    'pop': pop,
    if (rain != null) 'rain': rain!.toJson(),
    'sys': sys.toJson(),
    'dt_txt': dtTxt,
  };
} 