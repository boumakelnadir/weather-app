import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubits.dart';

class WeatherInfoLoaded extends StatelessWidget {
  const WeatherInfoLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    var details = BlocProvider.of<GetWeatherCubits>(context).weatherModel;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            details.nameCity,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'update at: ${details.date}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    'https:${details.icon}',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                  // Image.asset('assets/cloudy.png'),
                  Text(
                    details.avgtemp,
                    style: const TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'maxTemp:${details.maxtemp}°C',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'minTemp:${details.mintemp}°C',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
          Text(
            details.condition,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
