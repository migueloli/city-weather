part of 'details_bloc.dart';

sealed class DetailsEvent extends Equatable {
  const DetailsEvent();
}

final class FetchForecastEvent extends DetailsEvent {
  const FetchForecastEvent({required this.params});

  final LocationParams params;

  @override
  List<Object> get props => [params];
}
