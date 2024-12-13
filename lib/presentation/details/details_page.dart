import 'package:city_weather/injection/service_locator.dart';
import 'package:city_weather/presentation/details/bloc/details_bloc.dart';
import 'package:city_weather/presentation/details/widgets/details_forecast_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsBloc(
        getIt(),
        latitude,
        longitude,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Forecast'),
        ),
        body: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            if (state is DetailsError) {
              return Center(child: Text(state.message));
            }

            if (state is DetailsLoaded) {
              final forecast = state.forecast;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Text(
                            forecast.city.cityName,
                            style: TextStyle(fontSize: 24.0),
                          ),
                          Text(forecast.city.countryName),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 16),
                    ),
                    SliverList.separated(
                      itemBuilder: (context, index) => DetailsForecastItem(
                        forecast: forecast.hourlyForecast[index],
                      ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: forecast.hourlyForecast.length,
                    ),
                  ],
                ),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
