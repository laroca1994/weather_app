import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wheater_app/core/errors/failure.dart';
import 'package:wheater_app/feature/weather/data/repositories/weather_repository_impl.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';
import 'package:wheater_app/feature/weather/domain/repositories/weather_repository.dart';
// To access the provider

class GetWeatherForCity {
  GetWeatherForCity(this.repository);
  final WeatherRepository repository;

  Future<Either<Failure, WeatherEntity>> call({
    required String cityName,
    required String country,
  }) {
    return repository.getWeatherForCity(cityName);
  }
}

final getWeatherForCityUseCaseProvider = Provider<GetWeatherForCity>((ref) {
  return GetWeatherForCity(ref.watch(weatherRepositoryProvider));
});
