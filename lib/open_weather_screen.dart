import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_ex/constants.dart';
import 'package:json_ex/models/open_weather/open_weather.dart';

class OpenWeatherScreen extends StatelessWidget {
  Future<OpenWeather> getWeather() async {
    try {
      const String url =
          'http://api.openweathermap.org/data/2.5/weather?q=seoul&appid=$KEY';

      final http.Response response = await http.get(url);
      final responseData = json.decode(response.body);
      final OpenWeather ow = OpenWeather.fromJson(responseData);

      print(ow.toJson());

      return ow;
    } catch (err) {
      print(err);
      throw err;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flat Weather'),
      ),
      body: FutureBuilder(
        future: getWeather(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final ow = snapshot.data;

            return ListView(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              children: <Widget>[
                Text(
                  'longitude: ${ow.coord.lon}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'latitude: ${ow.coord.lat}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather id: ${ow.weather[0].id}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather main: ${ow.weather[0].main}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather main: ${ow.weather[0].main}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather description: ${ow.weather[0].description}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather icon: ${ow.weather[0].icon}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main temp: ${ow.main.temp}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main feels like: ${ow.main.feelsLike}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main temp max: ${ow.main.tempMax}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main temp min: ${ow.main.tempMin}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main pressure: ${ow.main.pressure}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main humidity: ${ow.main.humidity}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'visibility: ${ow.visibility}',
                  style: TextStyle(fontSize: 22),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
