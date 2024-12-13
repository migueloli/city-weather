part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  const HomeLoaded({required this.cities, List<City>? filteredCities})
      : filteredCities = filteredCities ?? cities;

  final List<City> cities;
  final List<City> filteredCities;

  @override
  List<Object> get props => [cities, filteredCities];
}

final class HomeError extends HomeState {
  const HomeError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
