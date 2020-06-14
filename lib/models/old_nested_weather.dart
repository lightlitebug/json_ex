class Coord {
  final double lon;
  final double lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'],
      lat: json['lat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "lon": lon,
      "lat": lat,
    };
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "main": main,
      "description": description,
      "icon": icon,
    };
  }
}

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "temp": temp,
      "feelsLike": feelsLike,
      "tempMin": tempMin,
      "tempMax": tempMax,
      "pressure": pressure,
      "humidity": humidity,
    };
  }
}

class OldNestedWeather {
  final Coord coord;
  final List<Weather> weather;
  final Main main;
  final int visibility;

  OldNestedWeather({
    this.coord,
    this.weather,
    this.main,
    this.visibility,
  });

  factory OldNestedWeather.fromJson(Map<String, dynamic> json) {
    return OldNestedWeather(
      coord: Coord.fromJson(json['coord']),
      weather: (json['weather'] as List)
          .map((e) => e == null ? null : Weather.fromJson(e))
          .toList(),
      main: Main.fromJson(json['main']),
      visibility: json['visibility'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "coord": coord.toJson(),
      "weather": weather.map((e) => e.toJson()).toList(),
      "main": main.toJson(),
      "visibility": visibility,
    };
  }
}
