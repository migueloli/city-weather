import 'package:city_weather/presentation/details/details_page.dart';
import 'package:city_weather/presentation/error/error_page.dart';
import 'package:city_weather/presentation/home/home_page.dart';
import 'package:city_weather/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter() {
  return GoRouter(
    errorBuilder: (context, state) => const ErrorPage(),
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: Routes.details,
        builder: (context, state) => const DetailsPage(),
      ),
    ],
  );
}
