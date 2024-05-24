import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class ServicesWeather {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apikey = '72bf007827bf44188de123151232404';

  ServicesWeather(this.dio);

  Future<WeatherModel> getweather({required String nameCity}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apikey&q=$nameCity',
      );

      // Map<String, dynamic> jsonData = response.data;
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data["error"]['message'] ?? 'Sorry guy there was error';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops Sorry,we will fixed this error, pls try later');
    }
  }
}
