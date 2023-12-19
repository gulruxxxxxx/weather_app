import 'package:weather_app/data/models/weather.dart';

import 'weather_main.dart';

class BaseModel {
  final List<WeatherModel> weather;
  final int dt;
  final MainModel main;
  final num windSpeed;
  final int clouds;
  final String sysCountry;
  final String name;
  final int code;

  BaseModel({
    required this.weather,
    required this.main,
    required this.windSpeed,
    required this.clouds,
    required this.sysCountry,
    required this.name,
    required this.code,
    required this.dt
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
        weather: ((json['weather'] as List)
            .map((e) => WeatherModel.fromJson(e))
            .toList()),
        main: MainModel.fromJson(json['main']),
        windSpeed: json['wind']['speed'] ?? 0,
        clouds: json['clouds']['all'] ?? 0,
        sysCountry: json['sys']['country'] ?? "",
        name: json['name'] ?? "",
        code: json['code'] ?? 0,
      dt: json['dt']??0

    );
  }
}
