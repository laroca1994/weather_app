// This screen might be redundant if HomeScreen's WeatherDisplay is sufficient.
// But if you want a dedicated page on tap (e.g. from a list), this is how.
// The current setup displays detail on HomeScreen itself.
// If you use this, ensure your GoRouter and list item taps navigate here.

import 'package:flutter/material.dart';
import 'package:wheater_app/domain/entities/weather_entity.dart';
import 'package:wheater_app/presentation/widgets/weather_display.dart';

class WeatherDetailScreen extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherDetailScreen({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weather.cityName),
      ),
      body: SingleChildScrollView( // Ensure content is scrollable if it overflows
        child: WeatherDisplay(weather: weather),
      ),
    );
  }
}