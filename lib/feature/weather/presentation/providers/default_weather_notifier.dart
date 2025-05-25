import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/core/constants/app_constants.dart';
import 'package:wheater_app/feature/weather/data/repositories/weather_repository_impl.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';
import 'package:wheater_app/feature/weather/domain/repositories/weather_repository.dart';

// Provider for the main weather display (current/searched city)
final defaultWeatherNotifierProvider =
    StateNotifierProvider<DefaultWeatherController, List<WeatherEntity>>((ref) {
      return DefaultWeatherController(ref.watch(weatherRepositoryProvider));
    });

class DefaultWeatherController extends StateNotifier<List<WeatherEntity>> {
  // To access other providers

  DefaultWeatherController(this._weatherRepository)
    : super(
        AppConstants.defaultCitiesCoordinates
            .map(WeatherEntity.fromCitiesCoordinates)
            .toList(),
      ) {
    init();
  }
  final WeatherRepository _weatherRepository;

  Future<void> init() async {
    final initialCities = List<WeatherEntity>.from(state);

    for (int i = 0; i < initialCities.length; i++) {
      final cityPlaceholder = initialCities[i];
      try {
        final cityWeather = await _weatherRepository.getWeatherForCity2(
          cityName: cityPlaceholder.cityName,
          imageUrl: cityPlaceholder.imageUrl!,
        );
        final currentState = List<WeatherEntity>.from(state);
        currentState[i] = cityWeather;
        debugPrint('ciudad $i $cityWeather');
        state = currentState;
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
