import 'package:app_development/weatherWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dataList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Information'),
        ),
        body: ListView.builder(
          itemCount: weatherDataList.length,
          itemBuilder: (context, index) {
            return WeatherWidget(weatherData: weatherDataList[index]);
          },
        ),
      ),
    );
  }
}
