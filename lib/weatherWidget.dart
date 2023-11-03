import 'package:app_development/weather.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherData weatherData;

  WeatherWidget({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(weatherData.city),
      subtitle: Text(
        'Temperature: ${weatherData.temperature}°C\nCondition: ${weatherData.condition}\nHumidity: ${weatherData.humidity}%\nWind Speed: ${weatherData.windSpeed} m/s',
      ),
    );
  }
}
