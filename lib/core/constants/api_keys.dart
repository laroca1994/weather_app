import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKeys {
  static String get openWeatherMapApiKey {
    final key = dotenv.env['OPENWEATHERMAP_API_KEY'];
    if (key == null) {
      throw Exception('OPENWEATHERMAP_API_KEY not found in .env file');
    }
    return key;
  }

  static String get googlePlacesApiKey {
    final key = dotenv.env['GOOGLE_PLACES_API_KEY'];
    if (key == null) {
      throw Exception('GOOGLE_PLACES_API_KEY not found in .env file');
    }
    return key;
  }

  static String get unplashApiKey {
    final key = dotenv.env['UNPLASH_API_KEY'];
    if (key == null) {
      throw Exception('UNPLASH_API_KEY not found in .env file');
    }
    return key;
  }
}
