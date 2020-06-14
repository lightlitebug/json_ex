// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenWeather _$OpenWeatherFromJson(Map<String, dynamic> json) {
  return OpenWeather(
    coord: json['coord'] == null
        ? null
        : Coord.fromJson(json['coord'] as Map<String, dynamic>),
    weather: (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    main: json['main'] == null
        ? null
        : Main.fromJson(json['main'] as Map<String, dynamic>),
    visibility: json['visibility'] as int,
  );
}

Map<String, dynamic> _$OpenWeatherToJson(OpenWeather instance) =>
    <String, dynamic>{
      'coord': instance.coord?.toJson(),
      'weather': instance.weather?.map((e) => e?.toJson())?.toList(),
      'main': instance.main?.toJson(),
      'visibility': instance.visibility,
    };
