import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wheater_app/core/errors/failure.dart';
import 'package:wheater_app/data/repositories/weather_repository_impl.dart';
import 'package:wheater_app/domain/entities/weather_entity.dart';
import 'package:wheater_app/domain/repositories/weather_repository.dart';
// To access the provider

class GetWeatherForCity {
  final WeatherRepository repository;
  GetWeatherForCity(this.repository);

  Future<Either<Failure, WeatherEntity>> call(String cityName) {
    return repository.getWeatherForCity(cityName);
  }
}

final getWeatherForCityUseCaseProvider = Provider<GetWeatherForCity>((ref) {
  return GetWeatherForCity(ref.watch(weatherRepositoryProvider));
});