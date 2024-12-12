import 'dart:async';

import 'package:city_weather/injection/service_locator.dart';
import 'package:city_weather/presentation/app/main_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  runZonedGuarded(
    () => runApp(const MainApp()),
    (error, stackTrace) {
      // We should add error logging here for a real project
      debugPrint('Error: $error');
      debugPrint('Stack Trace: $stackTrace');
    },
  );
}
