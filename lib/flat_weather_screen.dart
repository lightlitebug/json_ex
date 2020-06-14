import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_ex/constants.dart';
import 'package:json_ex/models/old_flat_weather.dart';

class FlatWeatherScreen extends StatelessWidget {
  Future<OldFlatWeather> getWeather() async {
    try {
      const String url =
          'http://api.openweathermap.org/data/2.5/weather?q=seoul&appid=$KEY';

      final http.Response response = await http.get(url);
      final responseData = json.decode(response.body);
      final OldFlatWeather ofw = OldFlatWeather.fromJson(responseData);

      print(ofw.toJson());

      return ofw;
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
            final ofw = snapshot.data;

            return ListView(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              children: <Widget>[
                Text(
                  'longitude: ${ofw.coordLon}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'latitude: ${ofw.coordLat}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather id: ${ofw.weatherId}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather main: ${ofw.weatherMain}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather main: ${ofw.weatherMain}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather description: ${ofw.weatherDescription}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'weather icon: ${ofw.weatherIcon}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main temp: ${ofw.mainTemp}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main feels like: ${ofw.mainFeelsLike}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main temp max: ${ofw.mainTempMax}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main temp min: ${ofw.mainTempMin}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main pressure: ${ofw.mainPressure}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'main humidity: ${ofw.mainHumidity}',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'visibility: ${ofw.visibility}',
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
