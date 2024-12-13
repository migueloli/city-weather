import 'package:city_weather/domain/entities/city.dart';
import 'package:city_weather/injection/service_locator.dart';
import 'package:city_weather/presentation/home/bloc/home_bloc.dart';
import 'package:city_weather/presentation/home/widgets/home_city_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(getIt()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cities'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeError) {
              return Center(child: Text(state.message));
            }

            if (state is HomeLoaded) {
              final List<City> cities = state.cities;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      HomeCityListItem(city: cities[index]),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: cities.length,
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
