import 'package:fpdart/fpdart.dart';
import 'package:wheater_app/core/errors/failure.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeatherForCity({
    required String cityName,
    required String imageUrl,
  });
  Future<Either<Failure, WeatherEntity>> getWeatherForCoordinates(
    double lat,
    double lon,
  );
  Future<Either<Failure, List<WeatherEntity>>>
  getSavedSearches(); // To display history
  // Potentially a method to clear cache or specific entry if needed
}
