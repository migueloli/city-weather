import 'package:city_weather/core/error/app_exception.dart';
import 'package:city_weather/core/error/app_exception_type.dart';

class ApiException implements AppException {
  const ApiException({
    required this.statusCode,
    required this.message,
    this.type = AppExceptionType.serverError,
  });

  @override
  final AppExceptionType type;
  final String message;
  final int statusCode;

  @override
  String toString() => 'ApiException: $statusCode - $message';
}
