import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheater_app/core/utils/weather_icon_mapper.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';
 // For date formatting, add to pubspec.yaml if not present

class WeatherDisplay extends StatelessWidget {
  final WeatherEntity weather;
  const WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${weather.cityName}${weather.country != null ? ", ${weather.country}" : ""}',
            style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          getWeatherIcon(weather.weatherIcon, size: 100),
          const SizedBox(height: 10),
          Text(
            '${weather.temperature.round()}°C',
            style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            weather.weatherDescription.capitalizeFirst(),
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWeatherInfoItem(
                icon: Icons.thermostat,
                label: 'Min/Max',
                value: '${weather.tempMin.round()}°/${weather.tempMax.round()}°',
              ),
              _buildWeatherInfoItem(
                icon: Icons.water_drop_outlined,
                label: 'Humidity',
                value: '${weather.humidity}%',
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               _buildWeatherInfoItem(
                icon: Icons.air,
                label: 'Wind',
                value: '${weather.windSpeed.toStringAsFixed(1)} m/s',
              ),
              if (weather.feelsLike != null)
                _buildWeatherInfoItem(
                  icon: Icons.person_outline,
                  label: 'Feels Like',
                  value: '${weather.feelsLike!.round()}°C',
                ),
            ],
          ),
          if (weather.lastFetched != null) ...[
            const SizedBox(height: 20),
            Text(
              'Last updated: ${DateFormat.yMd().add_jm().format(weather.lastFetched!.toLocal())}',
              style: textTheme.bodySmall,
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildWeatherInfoItem({required IconData icon, required String label, required String value}) {
    return Column(
      children: [
        Icon(icon, size: 28),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

extension StringExtension on String {
    String capitalizeFirst() {
      if (isEmpty) return this;
      return "${this[0].toUpperCase()}${substring(1)}";
    }
}