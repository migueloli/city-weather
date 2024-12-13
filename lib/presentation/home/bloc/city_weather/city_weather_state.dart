part of 'city_weather_bloc.dart';

sealed class CityWeatherState extends Equatable {
  const CityWeatherState();
}

final class CityWeatherInitial extends CityWeatherState {
  @override
  List<Object> get props => [];
}

final class CityWeatherLoading extends CityWeatherState {
  @override
  List<Object> get props => [];
}

final class CityWeatherLoaded extends CityWeatherState {
  const CityWeatherLoaded({required this.weather});

  final Weather weather;

  @override
  List<Object> get props => [weather];
}

final class CityWeatherError extends CityWeatherState {
  const CityWeatherError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
