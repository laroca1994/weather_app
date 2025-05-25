import 'package:wheater_app/core/models/city_coordinates.dart';
import 'package:wheater_app/gen/assets.gen.dart';

class AppConstants {
  static const String openWeatherMapBaseUrl =
      'https://api.openweathermap.org/data/2.5';

  static const String unplashBaseUrl = 'https://api.unsplash.com';

  static const List<(String, String)> defaultCities = [
    ('Montevideo', 'UY'),
    ('Londres', 'GB'), // London
    ('San Pablo', 'BR'), // Sao Paulo
    ('Buenos Aires', 'AR'),
    ('Munich', 'DE'),
  ];

  static List<CityCoordinates> defaultCitiesCoordinates = [
    CityCoordinates(
      city: 'Montevideo',
      lat: -34.9011,
      lon: -56.1645,
      imageUrl: Assets.images.montevideo.path,
    ),
    CityCoordinates(
      city: 'London',
      lat: 51.5074,
      lon: -0.1278,
      imageUrl: Assets.images.londres.path,
    ),
    CityCoordinates(
      city: 'São Paulo',
      lat: -23.5505,
      lon: -46.6333,
      imageUrl: Assets.images.sanPablo.path,
    ),
    CityCoordinates(
      city: 'Buenos Aires',
      lat: -34.6037,
      lon: -58.3816,
      imageUrl: Assets.images.buenosAires.path,
    ),
    CityCoordinates(
      city: 'Munich',
      lat: 48.1351,
      lon: 11.5820,
      imageUrl: Assets.images.munich.path,
    ),
  ];
}
