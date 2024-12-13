part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class FetchCitiesEvent extends HomeEvent {
  const FetchCitiesEvent();

  @override
  List<Object> get props => [];
}
