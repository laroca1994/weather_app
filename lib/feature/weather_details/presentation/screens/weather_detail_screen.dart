// --- Weather Screen Widget ---
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';

class WeatherDetailScreen extends StatelessWidget {
  const WeatherDetailScreen({
    required this.weather,
    required this.isDefaultCity,
    super.key,
  });
  final WeatherEntity weather;
  final bool isDefaultCity;

  String _formatTimeWithTimezone(int? timestamp, int? timezoneOffsetSeconds) {
    if (timestamp == null || timezoneOffsetSeconds == null) {
      return '--:--';
    }
    final localTimestamp = timestamp + timezoneOffsetSeconds;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      localTimestamp * 1000,
      isUtc: true,
    );
    return DateFormat('HH:mm').format(dateTime);
  }

  String _formatLastUpdated(DateTime? lastFetched) {
    if (lastFetched == null) {
      return 'N/A';
    }
    final now = DateTime.now();
    final difference = now.difference(lastFetched);
    if (difference.inSeconds < 60) {
      return 'Hace unos segundos';
    }
    if (difference.inMinutes < 2) {
      return 'Hace 1 minuto';
    }
    if (difference.inMinutes < 60) {
      return 'Hace ${difference.inMinutes} minutos';
    }
    if (difference.inHours < 2) {
      return 'Hace 1 hora';
    }
    if (difference.inHours < 24) {
      return 'Hace ${difference.inHours} horas';
    }
    return DateFormat('dd/MM/yyyy HH:mm').format(lastFetched);
  }

  String _formatPressure(int? pressure) {
    if (pressure == null) {
      return 'N/A';
    }
    if (pressure >= 1000) {
      final kpa = (pressure / 10).toStringAsFixed(1);
      return '$kpa kPa';
    }
    return '$pressure hPa';
  }

  String _formatVisibility(int? visibility) {
    if (visibility == null) {
      return 'N/A';
    }
    if (visibility >= 1000) {
      final km = (visibility / 1000).toStringAsFixed(1);
      return '$km km';
    }
    return '$visibility m';
  }

  int? _getTimezone() {
    if (weather.fullJson != null) {
      final json = jsonDecode(weather.fullJson!) as Map<String, dynamic>;
      return json['timezone'];
    }
    return null;
  }

  Widget _buildFlexibleSpaceBarBackground() {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        if (isDefaultCity)
          Image.asset(
            weather.imageUrl!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.lightBlue[300],
                alignment: Alignment.center,
                child: const Text(
                  'Error al cargar imagen',
                  style: TextStyle(color: Colors.white70),
                ),
              );
            },
          )
        else ...[
          if (weather.imageUrl != null)
            Image.network(
              weather.imageUrl!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.lightBlue[300],
                  alignment: Alignment.center,
                  child: const Text(
                    'Error al cargar imagen',
                    style: TextStyle(color: Colors.white70),
                  ),
                );
              },
            )
          else
            Container(),
        ],
        Container(color: Colors.black.withValues(alpha: 0.3)),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
            child: Text(
              weather.cityName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(150, 0, 0, 0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryTextColor = Colors.grey[800]!;
    final Color secondaryTextColor = Colors.grey[600]!;
    final Color cardBackgroundColor = Colors.grey[200]!;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight:
                150.0, // Height of the expanded app bar (image area)
            pinned: true, // The app bar will remain visible at the top
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true, // Centers the title in the collapsed app bar
              background: _buildFlexibleSpaceBarBackground(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildCurrentWeatherInfo(primaryTextColor, secondaryTextColor),
                const SizedBox(height: 24),
                _buildWeatherDetailsGrid(
                  primaryTextColor,
                  secondaryTextColor,
                  cardBackgroundColor,
                ),
                const SizedBox(height: 24),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentWeatherInfo(
    Color primaryTextColor,
    Color secondaryTextColor,
  ) {
    return Column(
      children: [
        Text(
          'Última actualización: ${_formatLastUpdated(weather.lastFetched)}',
          style: TextStyle(fontSize: 13, color: secondaryTextColor),
        ),
        const SizedBox(height: 16),
        if (weather.weatherIcon.isNotEmpty)
          Image.network(
            'https://openweathermap.org/img/wn/${weather.weatherIcon}@4x.png',
            height: 100,
            width: 100,
            errorBuilder:
                (context, error, stackTrace) =>
                    Icon(Icons.cloud_off, size: 80, color: secondaryTextColor),
          ),
        const SizedBox(height: 8),
        Text(
          '${weather.temperature.round()}°C',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
        ),
        Text(
          weather.weatherDescription,
          style: TextStyle(fontSize: 18, color: secondaryTextColor),
        ),
      ],
    );
  }

  Widget _buildWeatherDetailsGrid(
    Color primaryTextColor,
    Color secondaryTextColor,
    Color cardBackgroundColor,
  ) {
    int? pressure;
    int? visibility;
    if (weather.fullJson != null) {
      final json = jsonDecode(weather.fullJson!) as Map<String, dynamic>;
      pressure = json['main']['pressure'];
      visibility = json['visibility'];
    }

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.5, // Adjust as needed for your content
      children: [
        _buildDetailItem(
          title: 'Mín./Máx.',
          value:
              weather.tempMin != -1 && weather.tempMax != -1
                  ? '${weather.tempMin.round()}°C / ${weather.tempMax.round()}°C'
                  : 'N/A',
          primaryColor: primaryTextColor,
          secondaryColor: secondaryTextColor,
          backgroundColor: cardBackgroundColor,
        ),
        _buildDetailItem(
          title: 'Viento',
          value:
              weather.windSpeed != -1
                  ? '${weather.windSpeed.round()} km/h'
                  : 'N/A',
          primaryColor: primaryTextColor,
          secondaryColor: secondaryTextColor,
          backgroundColor: cardBackgroundColor,
        ),

        _buildDetailItem(
          title: 'Humedad',
          value: weather.humidity != -1 ? '${weather.humidity}%' : 'N/A',
          primaryColor: primaryTextColor,
          secondaryColor: secondaryTextColor,
          backgroundColor: cardBackgroundColor,
        ),
        _buildDetailItem(
          title: 'Presión',
          value: _formatPressure(pressure),
          primaryColor: primaryTextColor,
          secondaryColor: secondaryTextColor,
          backgroundColor: cardBackgroundColor,
        ),
        _buildDetailItem(
          title: 'Visibilidad',
          value: _formatVisibility(visibility),
          primaryColor: primaryTextColor,
          secondaryColor: secondaryTextColor,
          backgroundColor: cardBackgroundColor,
        ),
        _buildDetailItem(
          title: 'Amanecer/Atardecer',
          value:
              '${_formatTimeWithTimezone(weather.sunrise, _getTimezone())} / ${_formatTimeWithTimezone(weather.sunset, _getTimezone())}',
          primaryColor: primaryTextColor,
          secondaryColor: secondaryTextColor,
          backgroundColor: cardBackgroundColor,
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required String title,
    required String value,
    required Color primaryColor,
    required Color secondaryColor,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 13, color: secondaryColor)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            maxLines: 1, // Ensure text fits well
            overflow: TextOverflow.ellipsis, // Handle overflow
          ),
        ],
      ),
    );
  }
}
