import 'package:city_weather/core/error/app_exception.dart';
import 'package:city_weather/core/error/app_exception_message_extension.dart';
import 'package:city_weather/domain/entities/forecast.dart';
import 'package:city_weather/domain/usecases/get_weather_forecast_usecase.dart';
import 'package:city_weather/domain/usecases/params/location_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(
    this._getWeatherForecastUseCase,
    double latitude,
    double longitude,
  ) : super(DetailsInitial()) {
    on<FetchForecastEvent>(_onFetchForecastEvent);
    add(
      FetchForecastEvent(
        params: LocationParams(
          latitude: latitude,
          longitude: longitude,
        ),
      ),
    );
  }

  final GetWeatherForecastUseCase _getWeatherForecastUseCase;

  Future<void> _onFetchForecastEvent(FetchForecastEvent event, emit) async {
    emit(DetailsLoading());
    try {
      final forecast = await _getWeatherForecastUseCase(event.params);
      emit(DetailsLoaded(forecast: forecast));
    } on AppException catch (e) {
      emit(DetailsError(message: e.message));
    } catch (e) {
      emit(
        DetailsError(
          message: 'Something went wrong. Please try again later.',
        ),
      );
    }
  }
}
