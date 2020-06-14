import 'package:json_annotation/json_annotation.dart';

import 'coord.dart';
import 'main.dart';
import 'weather.dart';

part 'open_weather.g.dart';

@JsonSerializable(explicitToJson: true)
class OpenWeather {
  final Coord coord;
  final List<Weather> weather;
  final Main main;
  final int visibility;

  OpenWeather({
    this.coord,
    this.weather,
    this.main,
    this.visibility,
  });

  factory OpenWeather.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$OpenWeatherToJson(this);
}
