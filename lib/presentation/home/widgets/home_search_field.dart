import 'package:city_weather/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (query) {
        context.read<HomeBloc>().add(SearchCitiesEvent(query));
      },
      decoration: InputDecoration(
        hintText: 'Search cities...',
        border: OutlineInputBorder(),
      ),
    );
  }
}
