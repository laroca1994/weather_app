import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wheater_app/core/errors/failure.dart';
import 'package:wheater_app/feature/weather/data/repositories/weather_repository_impl.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';
import 'package:wheater_app/feature/weather/domain/repositories/weather_repository.dart';


class GetSavedSearches {
  GetSavedSearches(this.repository);
  final WeatherRepository repository;

  Future<Either<Failure, List<WeatherEntity>>> call() {
    return repository.getSavedSearches();
  }
}

final getSavedSearchesUseCaseProvider = Provider<GetSavedSearches>((ref) {
  return GetSavedSearches(ref.watch(weatherRepositoryProvider));
});