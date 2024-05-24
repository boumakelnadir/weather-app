class WeatherModel {
  final String date, nameCity, condition, icon, maxtemp, mintemp, avgtemp;

  WeatherModel({
    required this.date,
    required this.nameCity,
    required this.condition,
    required this.icon,
    required this.maxtemp,
    required this.mintemp,
    required this.avgtemp,
  });
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      date: json["current"]["last_updated"],
      nameCity: json['location']['name'],
      condition: json["forecast"]["forecastday"][0]['day']["condition"]['text'],
      icon: json["forecast"]["forecastday"][0]['day']["condition"]['icon'],
      maxtemp:
          json["forecast"]["forecastday"][0]['day']["maxtemp_c"].toString(),
      mintemp:
          json["forecast"]["forecastday"][0]['day']["mintemp_c"].toString(),
      avgtemp:
          json["forecast"]["forecastday"][0]['day']["avgtemp_c"].toString(),
    );
  }
}
