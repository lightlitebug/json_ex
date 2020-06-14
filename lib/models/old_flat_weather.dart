class OldFlatWeather {
  final double coordLon;
  final double coordLat;
  final int weatherId;
  final String weatherMain;
  final String weatherDescription;
  final String weatherIcon;
  final double mainTemp;
  final double mainFeelsLike;
  final double mainTempMin;
  final double mainTempMax;
  final int mainPressure;
  final int mainHumidity;
  final int visibility;

  OldFlatWeather({
    this.coordLon,
    this.coordLat,
    this.weatherId,
    this.weatherMain,
    this.weatherDescription,
    this.weatherIcon,
    this.mainTemp,
    this.mainFeelsLike,
    this.mainTempMin,
    this.mainTempMax,
    this.mainPressure,
    this.mainHumidity,
    this.visibility,
  });

  factory OldFlatWeather.fromJson(Map<String, dynamic> json) {
    return OldFlatWeather(
      coordLon: json["coord"]["lon"],
      coordLat: json["coord"]["lat"],
      weatherId: json["weather"][0]["id"],
      weatherMain: json["weather"][0]["main"],
      weatherDescription: json["weather"][0]["description"],
      weatherIcon: json["weather"][0]["icon"],
      mainTemp: json["main"]["temp"],
      mainFeelsLike: json["main"]["feels_like"],
      mainTempMin: json["main"]["temp_min"],
      mainTempMax: json["main"]["temp_max"],
      mainPressure: json["main"]["pressure"],
      mainHumidity: json["main"]["humidity"],
      visibility: json["visibility"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "coordLon": coordLon,
      "coordLat": coordLat,
      "weahterId": weatherId,
      "weatherMain": weatherMain,
      "weatherDescription": weatherDescription,
      "weatherIcon": weatherIcon,
      "mainTemp": mainTemp,
      "mainFeelsLike": mainFeelsLike,
      "mainTempMin": mainTempMin,
      "mainTempMax": mainTempMax,
      "mainPressure": mainPressure,
      "mainHumidity": mainHumidity,
      "visibility": visibility,
    };
  }
}
