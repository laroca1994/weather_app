// --- Weather Screen Widget ---
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';

class WeatherDetailScreen extends StatelessWidget {
  const WeatherDetailScreen({required this.weather, super.key});
  final WeatherEntity weather;

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

  @override
  Widget build(BuildContext context) {
    final Color primaryTextColor = Colors.grey[800]!;
    final Color secondaryTextColor = Colors.grey[600]!;
    const Color headerBackgroundColor = Color(
      0xFFB0E0E6,
    ); // Un azul cielo más claro
    final Color cardBackgroundColor = Colors.grey[200]!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context, headerBackgroundColor, primaryTextColor),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildCurrentWeatherInfo(
                      primaryTextColor,
                      secondaryTextColor,
                    ),
                    const SizedBox(height: 24),
                    _buildWeatherDetailsGrid(
                      primaryTextColor,
                      secondaryTextColor,
                      cardBackgroundColor,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    Color headerBaseColor,
    Color textColor,
  ) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Imagen de fondo
        Image.asset(
          weather.imageUrl!, // Usamos la ruta del asset
          height: 150, // Ajusta la altura según necesites
          width: double.infinity,
          fit: BoxFit.cover, // Para que la imagen cubra el espacio
          errorBuilder: (context, error, stackTrace) {
            // Si la imagen del asset no se puede cargar
            return Container(
              height: 150,
              color: Colors.lightBlue[300],
              alignment: Alignment.center,
              child: const Text(
                'Error al cargar imagen',
                style: TextStyle(color: Colors.white70),
              ),
            );
          },
        ),
        // Contenedor para oscurecer un poco la imagen y mejorar legibilidad (opcional)
        Container(
          height: 150,
          width: double.infinity,
          color: Colors.black.withValues(alpha: 0.3), // Ajusta la opacidad
        ),
        // Texto del nombre de la ciudad
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Text(
            weather.cityName, // Este es el cityName grande
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Texto blanco para contrastar con la imagen
              shadows: <Shadow>[
                // Sombra para mejorar legibilidad sobre imágenes variadas
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(150, 0, 0, 0),
                ),
              ],
            ),
          ),
        ),
      ],
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
          weather.weatherDescription, // Este campo sí lo tienes
          style: TextStyle(fontSize: 18, color: secondaryTextColor),
        ),
      ],
    );
  }

  String _formatPressure(int? pressure) {
    if (pressure == null) {
      return 'N/A';
    }
    // Convertir hPa a kPa si es posible
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
      childAspectRatio: 2.5,
      children: [
        _buildDetailItem(
          title: 'Mín./Máx.',
          value: '${weather.tempMin.round()}°C / ${weather.tempMax.round()}°C',
          primaryColor: primaryTextColor,
          secondaryColor: secondaryTextColor,
          backgroundColor: cardBackgroundColor,
        ),
        _buildDetailItem(
          title: 'Viento',
          // Solo mostramos velocidad, ya que la dirección no está en WeatherEntity
          value: '${weather.windSpeed.round()} km/h',
          primaryColor: primaryTextColor,
          secondaryColor: secondaryTextColor,
          backgroundColor: cardBackgroundColor,
        ),
        _buildDetailItem(
          title: 'Humedad',
          value: '${weather.humidity}%',
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
          ),
        ],
      ),
    );
  }
}
