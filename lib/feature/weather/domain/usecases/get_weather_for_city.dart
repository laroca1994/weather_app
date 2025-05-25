import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/feature/weather/data/repositories/weather_repository_impl.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';
import 'package:wheater_app/feature/weather/domain/repositories/weather_repository.dart';
// To access the provider

class GetWeatherForCity {
  GetWeatherForCity(this.repository);
  final WeatherRepository repository;

  Future<WeatherEntity> call({
    required String cityName,
    required String imageUrl,
  }) {
    return repository.getWeatherForCity(cityName: cityName, imageUrl: imageUrl);
  }
}

final getWeatherForCityUseCaseProvider = Provider<GetWeatherForCity>((ref) {
  return GetWeatherForCity(ref.watch(weatherRepositoryProvider));
});
