import 'package:city_weather/core/error/network_exception.dart';
import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/domain/repositories/city_repository.dart';
import 'package:city_weather/domain/usecases/get_cities_usecase.dart';
import 'package:city_weather/domain/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cities_usecase_test.mocks.dart';

@GenerateMocks([CityRepository])
void main() {
  late GetCitiesUseCase useCase;
  late CityRepository mockCityRepository;

  setUp(() {
    mockCityRepository = MockCityRepository();
    useCase = GetCitiesUseCase(mockCityRepository);
  });

  test(
    'should return a list of cities when the repository returns data',
    () async {
      // Arrange
      final cities = [
        City(
          cityName: 'Test City',
          countryName: 'Test Country',
          latitude: 0.0,
          longitude: 0.0,
        ),
      ];
      when(mockCityRepository.getCities()).thenAnswer((_) async => cities);

      // Act
      final result = await useCase(const NoParams());

      // Assert
      expect(result, cities);
      verify(mockCityRepository.getCities());
      verifyNoMoreInteractions(mockCityRepository);
    },
  );

  test(
    'should throw an exception when the repository fails',
    () async {
      // Arrange
      when(mockCityRepository.getCities()).thenThrow(NetworkException());

      // Act & Assert
      expect(() => useCase(const NoParams()), throwsA(isA<NetworkException>()));
      verify(mockCityRepository.getCities()).called(1);
    },
  );
}
