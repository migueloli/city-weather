part of 'city_weather_bloc.dart';

sealed class CityWeatherEvent extends Equatable {
  const CityWeatherEvent();

  @override
  List<Object?> get props => [];
}

class FetchCityWeatherEvent extends CityWeatherEvent {
  const FetchCityWeatherEvent(this.city);

  final City city;

  @override
  List<Object?> get props => [city];
}
