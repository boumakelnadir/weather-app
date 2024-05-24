import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubits.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'Search',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(15),
            height: 85,
            child: TextField(
              style: const TextStyle(fontSize: 20),
              onSubmitted: (value) async {
                var fetchWeather = BlocProvider.of<GetWeatherCubits>(context);
                fetchWeather.getWeatherCubit(nameCity: value);
                Navigator.pop(context);
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.all(15),
                suffixIcon: Icon(Icons.search),
                hintText: 'Search ',
                hintStyle: TextStyle(fontSize: 18),
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                labelText: 'Search for your City',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
