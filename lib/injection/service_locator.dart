import 'package:city_weather/core/config/environment_config.dart';
import 'package:city_weather/core/network/api_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => ApiClient(
      baseUrl: EnvironmentConfig.baseUrl,
      defaultHeaders: {
        'Content-Type': 'application/json',
      },
    )
  );
}