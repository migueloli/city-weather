part of 'routes.dart';

GoRouter goRouter() {
  return GoRouter(
    errorBuilder: (context, state) => const ErrorPage(),
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: Routes._details,
        builder: (context, state) => DetailsPage(
          latitude:
              double.tryParse(state.uri.queryParameters['latitude'] ?? '0') ??
                  0,
          longitude:
              double.tryParse(state.uri.queryParameters['longitude'] ?? '0') ??
                  0,
        ),
      ),
    ],
  );
}
