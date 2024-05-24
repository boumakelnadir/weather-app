class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherInfoLoadedState extends WeatherState {
  WeatherInfoLoadedState();
}

class WeatherInfoFailedState extends WeatherState {}
