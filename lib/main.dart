import 'package:flutter/material.dart';
import 'package:json_ex/flat_weather_screen.dart';
import 'package:json_ex/nested_weather_screen.dart';
import 'package:json_ex/open_weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FlatWeatherScreen();
                      },
                    ),
                  );
                },
                child: Text('Flat Data Structure'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NestedWeatherScreen();
                      },
                    ),
                  );
                },
                child: Text('Nested Data Structure'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OpenWeatherScreen();
                      },
                    ),
                  );
                },
                child: Text('JSON_SERIALIZABLE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
