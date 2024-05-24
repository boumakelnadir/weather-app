import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubits.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_state.dart';

import 'package:weatherapp/widget/no_info_weather.dart';
import 'package:weatherapp/views/search_view.dart';
import 'package:weatherapp/widget/weather_info_loaded.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
          elevation: 5,
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'WeatherApp',
            style: TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<GetWeatherCubits, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return const NoInfoWeather();
            } else if (state is WeatherInfoLoadedState) {
              return WeatherInfoLoaded();
            } else {
              return const Center(
                  child: Text(
                'ooops there was an Error Sorry ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ));
            }
          },
        ),
      ),
    );
  }
}
