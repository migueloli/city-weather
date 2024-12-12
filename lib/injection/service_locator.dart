import 'package:city_weather/core/config/environment_config.dart';
import 'package:city_weather/core/network/api_client.dart';
import 'package:city_weather/data/datasources/open_weather_data_source.dart';
import 'package:city_weather/data/datasources/weather_data_source.dart';
import 'package:city_weather/data/repositories/weather_repository_impl.dart';
import 'package:city_weather/domain/repositories/weather_repository.dart';
import 'package:get_it/get_it.dart';
final getIt = GetIt.instance;

void setupServiceLocator() {
  // Core
  getIt.registerLazySingleton(() => ApiClient(
      baseUrl: EnvironmentConfig.baseUrl,
      defaultHeaders: {
        'Content-Type': 'application/json',
      },
    )
  );

  // Data sources
  getIt.registerLazySingleton<WeatherDataSource>(
    () => OpenWeatherDataSource(
      apiClient: getIt(),
      apiKey: EnvironmentConfig.apiKey,
    ),
  );

  // Repositories
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      dataSource: getIt(),
    ),
  );
}