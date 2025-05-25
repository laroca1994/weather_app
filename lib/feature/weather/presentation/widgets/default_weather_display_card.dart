import 'package:flutter/material.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';

class DefaultWeatherDisplayCard extends StatelessWidget {
  const DefaultWeatherDisplayCard({required this.weatherData, super.key});
  final WeatherEntity weatherData;

  // Helper para construir la URL del icono de OpenWeatherMap
  // Ejemplo: weatherIcon = "02d" -> https://openweathermap.org/img/wn/02d@2x.png
  String _getWeatherIconUrl(String? iconCode) {
    if (iconCode == null || iconCode.isEmpty) {
      // Puedes retornar una URL de placeholder o una imagen local por defecto
      return 'https://via.placeholder.com/50?text=N/A';
    }
    return 'https://openweathermap.org/img/wn/$iconCode@2x.png';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Sección superior con imagen de fondo y nombre de la ciudad
          Stack(
            alignment: Alignment.center,
            children: [
              // Imagen de fondo
              Image.asset(
                weatherData.imageUrl!, // Usamos la ruta del asset
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
                color: Colors.black.withValues(
                  alpha: 0.3,
                ), // Ajusta la opacidad
              ),
              // Texto del nombre de la ciudad
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0,
                ),
                child: Text(
                  weatherData.cityName, // Este es el cityName grande
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color:
                        Colors
                            .white, // Texto blanco para contrastar con la imagen
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
          ),
          // Sección inferior blanca con los detalles
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   weatherData
                      //       .cityName, // Nombre de la ciudad de nuevo, más pequeño
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w600,
                      //     color: Colors.teal[700],
                      //   ),
                      // ),
                      const SizedBox(height: 8),
                      Text(
                        weatherData.temperature == -1
                            ? '--°C'
                            : '${weatherData.temperature.toStringAsFixed(0)}°C',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        weatherData.weatherDescription.isNotEmpty
                            ? weatherData.weatherDescription
                            : 'No disponible',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                if (weatherData.weatherIcon.isNotEmpty)
                  Image.network(
                    _getWeatherIconUrl(weatherData.weatherIcon),
                    width: 60,
                    height: 60,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.cloud_off,
                        size: 50,
                        color: Colors.grey,
                      );
                    },
                    loadingBuilder: (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            value:
                                loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
