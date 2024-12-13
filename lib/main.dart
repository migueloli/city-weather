import 'dart:async';

import 'package:city_weather/injection/service_locator.dart';
import 'package:city_weather/presentation/app/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await dotenv.load();
        setupServiceLocator();
        runApp(const MainApp());
      },
      (error, stackTrace) {
        // We should add error logging here for a real project
        debugPrint('Error: $error');
        debugPrint('Stack Trace: $stackTrace');
      },
    );
