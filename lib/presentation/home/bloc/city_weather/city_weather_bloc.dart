import 'package:city_weather/core/error/app_exception.dart';
import 'package:city_weather/core/error/app_exception_message_extension.dart';
import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/entities/weather.dart';
import 'package:city_weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:city_weather/domain/usecases/params/location_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'city_weather_event.dart';
part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {
  CityWeatherBloc(this._currentWeatherUseCase, City city)
      : super(CityWeatherInitial()) {
    on<FetchCityWeatherEvent>(_onFetchCityWeatherEvent);
    add(FetchCityWeatherEvent(city));
  }

  final GetCurrentWeatherUseCase _currentWeatherUseCase;

  Future<void> _onFetchCityWeatherEvent(
    FetchCityWeatherEvent event,
    emit,
  ) async {
    try {
      final params = LocationParams(
        latitude: event.city.latitude,
        longitude: event.city.longitude,
      );
      final weather = await _currentWeatherUseCase(params);
      emit(CityWeatherLoaded(weather: weather));
    } on AppException catch (e) {
      emit(CityWeatherError(message: e.message));
    } catch (e) {
      emit(
        CityWeatherError(
          message: 'Something went wrong. Please try again later.',
        ),
      );
    }
  }
}
