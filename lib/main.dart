import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubits.dart';
import 'package:weatherapp/views/home_view.dart';

main() {
  // ServicesWeather(Dio()).getweather(nameCity: 'ouargla');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubits(),
      child: Builder(
        builder: (context) => MaterialApp(
          theme: ThemeData(
            useMaterial3: false,
            primaryColor: Colors.orange,
            // colorSchemeSeed: Colors.orangeAccent,
            // primarySwatch: Colors.amber,
            // scaffoldBackgroundColor: Colors.lightBlue,

            brightness: Brightness.light,
          ),
          debugShowCheckedModeBanner: false,
          title: 'Weather app demo',
          home: const HomeView(),
        ),
      ),
    );
  }
}
