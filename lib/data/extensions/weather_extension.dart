import 'package:city_weather/data/models/city_weather.dart';
import 'package:city_weather/data/models/current_weather_response.dart';
import 'package:city_weather/data/models/forecast_item.dart';
import 'package:city_weather/data/models/forecast_response.dart';
import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/entities/forecast.dart';
import 'package:city_weather/domain/entities/weather.dart';

extension CurrentWeatherResponseExtension on CurrentWeatherResponse {
  Weather toDomain() => Weather(
        temperature: main.temp,
        feelsLike: main.feelsLike,
        humidity: main.humidity,
        windSpeed: wind.speed,
        description: weather.first.description,
        icon: weather.first.icon,
        timestamp: DateTime.fromMillisecondsSinceEpoch(dt * 1000),
      );
}

extension ForecastResponseExtension on ForecastResponse {
  Forecast toDomain() => Forecast(
        hourlyForecast: list.map((item) => item.toDomain()).toList(),
        city: city.toDomain(),
      );
}

extension ForecastItemExtension on ForecastItem {
  Weather toDomain() => Weather(
        temperature: main.temp,
        feelsLike: main.feelsLike,
        humidity: main.humidity,
        windSpeed: wind.speed,
        description: weather.first.description,
        icon: weather.first.icon,
        timestamp: DateTime.parse(dtTxt),
      );
}

extension WeatherModelExtension on Weather {
  Weather toDomain() => Weather(
        temperature: temperature,
        feelsLike: feelsLike,
        humidity: humidity,
        windSpeed: windSpeed,
        description: description,
        icon: icon,
        timestamp: timestamp,
      );
}

extension CityWeatherExtension on CityWeather {
  City toDomain() => City(
        cityName: name,
        countryName: country,
        countryCode: country,
        latitude: coord.lat,
        longitude: coord.lon,
      );
}
