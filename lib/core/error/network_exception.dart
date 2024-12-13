import 'package:city_weather/core/error/app_exception.dart';
import 'package:city_weather/core/error/app_exception_type.dart';

class NetworkException implements AppException {
  const NetworkException({
    this.type = AppExceptionType.networkConnection,
  });

  @override
  final AppExceptionType type;

  @override
  String toString() => 'No internet connection available';
}
