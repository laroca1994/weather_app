import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';
import 'package:wheater_app/feature/weather/domain/usecases/get_current_position.dart';
import 'package:wheater_app/feature/weather/domain/usecases/get_saved_searches.dart';
import 'package:wheater_app/feature/weather/domain/usecases/get_weather_for_coordinates.dart';

// Provider for the main weather display (current/searched city)
final weatherNotifierProvider =
    AsyncNotifierProvider<WeatherNotifier, WeatherEntity?>(() {
      return WeatherNotifier();
    });

class WeatherNotifier extends AsyncNotifier<WeatherEntity?> {
  @override
  FutureOr<WeatherEntity?> build() async {
    return null;
  }

  Future<void> fetchWeatherForCoordinates({
    required double lat,
    required double lon,
  }) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref
          .read(getWeatherForCoordinatesUseCaseProvider)
          .call(lat, lon);
      result.fold(
        (failure) =>
            state = AsyncValue.error(failure.message, StackTrace.current),
        (weather) => state = AsyncValue.data(weather),
      );
      // After fetching, update the saved searches list as well
      ref
          .read(savedSearchesNotifierProvider.notifier)
          .fetchSavedSearches()
          .ignore();
    } catch (e) {
      state = AsyncValue.error(
        'Failed to get location or weather: ${e.toString()}',
        StackTrace.current,
      );
    }
  }

  Future<void> fetchWeatherForCurrentLocation() async {
    state = const AsyncValue.loading();
    try {
      ref.invalidate(currentPositionProvider);
      final position = await ref.read(currentPositionProvider.future);
      final result = await ref
          .read(getWeatherForCoordinatesUseCaseProvider)
          .call(position.latitude, position.longitude);
      result.fold(
        (failure) =>
            state = AsyncValue.error(failure.message, StackTrace.current),
        (weather) => state = AsyncValue.data(weather),
      );
      // After fetching, update the saved searches list as well
      ref
          .read(savedSearchesNotifierProvider.notifier)
          .fetchSavedSearches()
          .ignore();
    } catch (e) {
      state = AsyncValue.error(
        'Failed to get location or weather: ${e.toString()}',
        StackTrace.current,
      );
    }
  }
}

// Provider for the list of saved searches
final savedSearchesNotifierProvider =
    AsyncNotifierProvider<SavedSearchesNotifier, List<WeatherEntity>>(() {
      return SavedSearchesNotifier();
    });

class SavedSearchesNotifier extends AsyncNotifier<List<WeatherEntity>> {
  @override
  FutureOr<List<WeatherEntity>> build() async {
    final result = await ref.watch(getSavedSearchesUseCaseProvider).call();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (searches) => searches,
    );
  }

  Future<void> fetchSavedSearches() async {
    state = const AsyncValue.loading();
    final result = await ref.watch(getSavedSearchesUseCaseProvider).call();
    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (searches) => state = AsyncValue.data(searches),
    );
  }
}
