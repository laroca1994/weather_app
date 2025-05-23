import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wheater_app/core/errors/failure.dart';
import 'package:wheater_app/data/repositories/weather_repository_impl.dart';
import 'package:wheater_app/domain/entities/weather_entity.dart';
import 'package:wheater_app/domain/repositories/weather_repository.dart';


class GetWeatherForCurrentLocation {
  final WeatherRepository repository;
  GetWeatherForCurrentLocation(this.repository);

  Future<Either<Failure, WeatherEntity>> call(double lat, double lon) {
    return repository.getWeatherForCoordinates(lat, lon);
  }
}

final getWeatherForCurrentLocationUseCaseProvider = Provider<GetWeatherForCurrentLocation>((ref) {
  return GetWeatherForCurrentLocation(ref.watch(weatherRepositoryProvider));
});