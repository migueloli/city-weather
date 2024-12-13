import 'package:city_weather/core/error/app_exception_message_extension.dart';
import 'package:city_weather/core/error/network_exception.dart';
import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/entities/weather.dart';
import 'package:city_weather/domain/usecases/get_cities_usecase.dart';
import 'package:city_weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:city_weather/domain/usecases/params/location_params.dart';
import 'package:city_weather/domain/usecases/usecase.dart';
import 'package:city_weather/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_page_test.mocks.dart';

final getIt = GetIt.instance;

@GenerateMocks([
  GetCitiesUseCase,
  GetCurrentWeatherUseCase,
])
void main() {
  void registerMockDependencies() async {
    await getIt.reset(); // Clear previously registered instances
    getIt.registerLazySingleton<GetCitiesUseCase>(MockGetCitiesUseCase.new);
    getIt.registerLazySingleton<GetCurrentWeatherUseCase>(
      MockGetCurrentWeatherUseCase.new,
    );
  }

  setUp(registerMockDependencies);

  testWidgets(
    'HomePage displays cities when loaded',
    (WidgetTester tester) async {
      // Arrange
      final cities = [
        City(
          cityName: 'Test City',
          countryName: 'Test Country',
          latitude: 0,
          longitude: 0,
        ),
      ];
      when(getIt<GetCitiesUseCase>().call(const NoParams()))
          .thenAnswer((_) async => cities);
      final params = LocationParams(latitude: 0, longitude: 0);
      final weather = Weather(
        temperature: 25.0,
        feelsLike: 27.0,
        humidity: 65,
        windSpeed: 5.5,
        name: 'San Francisco',
        description: 'Clear sky',
        icon: '01d', // Clear day icon (use OpenWeatherMap-style icon codes)
        timestamp: DateTime.now(),
      );
      when(getIt<GetCurrentWeatherUseCase>().call(params))
          .thenAnswer((_) async => weather);
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
        ),
      );

      // Act
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Cities'), findsOneWidget);
      expect(
        find.text('${cities.first.cityName}, ${cities.first.countryName}'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'HomePage shows error message when error occurs',
    (WidgetTester tester) async {
      // Arrange
      final exception = NetworkException();
      when(getIt<GetCitiesUseCase>().call(const NoParams()))
          .thenThrow(exception);
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
        ),
      );

      // Act
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(exception.message), findsOneWidget);
    },
  );
}
