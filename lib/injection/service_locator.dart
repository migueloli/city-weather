import 'package:city_weather/core/config/environment_config.dart';
import 'package:city_weather/core/network/api_client.dart';
import 'package:city_weather/core/utils/network_info/network_info_impl.dart';
import 'package:city_weather/data/datasources/city_data_source.dart';
import 'package:city_weather/data/datasources/open_weather_data_source.dart';
import 'package:city_weather/data/datasources/weather_data_source.dart';
import 'package:city_weather/data/repositories/weather_repository_impl.dart';
import 'package:city_weather/domain/repositories/weather_repository.dart';
import 'package:city_weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:city_weather/domain/usecases/get_weather_forecast_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:city_weather/data/datasources/city_memory_data_source.dart';
import 'package:city_weather/data/repositories/city_repository_impl.dart';
import 'package:city_weather/domain/repositories/city_repository.dart';
import 'package:city_weather/domain/usecases/get_cities_usecase.dart';
import 'package:city_weather/core/utils/network_info/network_info.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // External
  getIt.registerLazySingleton(() => InternetConnection());

  // Core
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt()),
  );
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
  getIt.registerLazySingleton<CityDataSource>(
    () => CityMemoryDataSource(),
  );

  // Repositories
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      dataSource: getIt(),
      networkInfo: getIt(),
    ),
  );
  getIt.registerLazySingleton<CityRepository>(
    () => CityRepositoryImpl(
      dataSource: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(
    () => GetCurrentWeatherUseCase(getIt()),
  );
  getIt.registerLazySingleton(
    () => GetWeatherForecastUseCase(getIt()),
  );
  getIt.registerLazySingleton(
    () => GetCitiesUseCase(getIt()),
  );
}