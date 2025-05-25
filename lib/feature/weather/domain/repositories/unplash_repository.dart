import 'package:wheater_app/feature/weather/data/models/unplash_model.dart';

abstract class UnplashRepository {
  Future<List<Photo>> getPhotosFromCityName(String cityName);
  // Potentially a method to clear cache or specific entry if needed
}
