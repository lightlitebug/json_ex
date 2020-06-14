import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_ex/constants.dart';
import 'package:json_ex/models/old_nested_weather.dart';

class NestedWeatherScreen extends StatelessWidget {
  Future<OldNestedWeather> getWeather() async {
    try {
      const String url =
          'http://api.openweathermap.org/data/2.5/weather?q=seoul&appid=$KEY';

      final http.Response response = await http.get(url);
      final responseData = json.decode(response.body);
      final OldNestedWeather onw = OldNestedWeather.fromJson(responseData);

      print(onw.toJson());

      return onw;
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
            final onw = snapshot.data;

            return ListView(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              children: <Widget>[
                Text(
                  'longitude: ${onw.coord.lon}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'latitude: ${onw.coord.lat}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather id: ${onw.weather[0].id}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather main: ${onw.weather[0].main}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather main: ${onw.weather[0].main}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather description: ${onw.weather[0].description}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather icon: ${onw.weather[0].icon}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main temp: ${onw.main.temp}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main feels like: ${onw.main.feelsLike}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main temp max: ${onw.main.tempMax}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main temp min: ${onw.main.tempMin}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main pressure: ${onw.main.pressure}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main humidity: ${onw.main.humidity}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'visibility: ${onw.visibility}',
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
