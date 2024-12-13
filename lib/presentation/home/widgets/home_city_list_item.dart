import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/injection/service_locator.dart';
import 'package:city_weather/presentation/home/bloc/city_weather/city_weather_bloc.dart';
import 'package:city_weather/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeCityListItem extends StatelessWidget {
  const HomeCityListItem({super.key, required this.city});

  final City city;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CityWeatherBloc(getIt(), city),
      child: GestureDetector(
        onTap: () async => _onTap(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            Text(
              '${city.cityName}, ${city.countryName}',
            ),
            BlocBuilder<CityWeatherBloc, CityWeatherState>(
              builder: (context, state) {
                if (state is CityWeatherLoaded) {
                  final weather = state.weather;
                  return Text(
                    '${weather.name} - ${weather.temperature.round()}°C',
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTap(BuildContext context) => context.push(
        Routes.details(
          latitude: city.latitude,
          longitude: city.longitude,
        ),
      );
}
