import 'package:city_weather/presentation/details/details_page.dart';
import 'package:city_weather/presentation/error/error_page.dart';
import 'package:city_weather/presentation/home/home_page.dart';
import 'package:go_router/go_router.dart';

part 'go_router.dart';

abstract class Routes {
  const Routes._();

  static const home = '/';

  static const _details = '/details';
  static String details({
    required double latitude,
    required double longitude,
  }) =>
      Uri(
        path: _details,
        queryParameters: {
          'latitude': '$latitude',
          'longitude': '$longitude',
        },
      ).toString();
}
