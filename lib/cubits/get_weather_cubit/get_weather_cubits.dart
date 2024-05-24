import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/services_weather.dart';

class GetWeatherCubits extends Cubit<WeatherState> {
  GetWeatherCubits() : super(WeatherInitialState());
  late WeatherModel weatherModel;
  getWeatherCubit({required String nameCity}) async {
    try {
      weatherModel =
          await ServicesWeather(Dio()).getweather(nameCity: nameCity);
      emit(WeatherInfoLoadedState());
    } catch (e) {
      emit(WeatherInfoFailedState());
    }
  }
}
