part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeLoaded extends HomeState {
  const HomeLoaded({required this.cities});

  final List<City> cities;

  @override
  List<Object> get props => [cities];
}

final class HomeError extends HomeState {
  const HomeError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
