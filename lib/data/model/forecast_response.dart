import 'package:city_weather/data/model/city.dart';
import 'package:city_weather/data/model/forecast_item.dart';

class ForecastResponse {
  final String cod;
  final int message;
  final int cnt;
  final List<ForecastItem> list;
  final City city;

  ForecastResponse({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory ForecastResponse.fromJson(Map<String, dynamic> json) {
    return ForecastResponse(
      cod: json['cod'] ?? '',
      message: json['message'] ?? 0,
      cnt: json['cnt'] ?? 0,
      list: (json['list'] as List)
          .map((item) => ForecastItem.fromJson(item))
          .toList(),
      city: City.fromJson(json['city']),
    );
  }

  Map<String, dynamic> toJson() => {
    'cod': cod,
    'message': message,
    'cnt': cnt,
    'list': list.map((item) => item.toJson()).toList(),
    'city': city.toJson(),
  };
} 