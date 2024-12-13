import 'package:city_weather/core/error/app_exception.dart';
import 'package:city_weather/core/error/app_exception_message_extension.dart';
import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/usecases/get_cities_usecase.dart';
import 'package:city_weather/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.getCitiesUseCase) : super(HomeInitial()) {
    on<FetchCitiesEvent>(_onFetchCities);
    add(const FetchCitiesEvent());
  }

  final GetCitiesUseCase getCitiesUseCase;

  void _onFetchCities(FetchCitiesEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final cities = await getCitiesUseCase(const NoParams());
      emit(HomeLoaded(cities: cities));
    } on AppException catch (e) {
      emit(HomeError(message: e.message));
    } catch (e) {
      emit(HomeError(message: 'Something went wrong. Please try again later.'));
    }
  }
}
