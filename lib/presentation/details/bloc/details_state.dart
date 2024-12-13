part of 'details_bloc.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();
}

final class DetailsInitial extends DetailsState {
  const DetailsInitial();

  @override
  List<Object> get props => [];
}

final class DetailsLoading extends DetailsState {
  const DetailsLoading();

  @override
  List<Object> get props => [];
}

final class DetailsLoaded extends DetailsState {
  const DetailsLoaded({required this.forecast});

  final Forecast forecast;

  @override
  List<Object> get props => [forecast];
}

final class DetailsError extends DetailsState {
  const DetailsError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
