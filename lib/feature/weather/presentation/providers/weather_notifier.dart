import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/feature/weather/domain/usecases/get_current_position.dart';
import 'package:wheater_app/feature/weather/domain/usecases/get_saved_searches.dart';
import 'package:wheater_app/feature/weather/domain/usecases/get_weather_for_city.dart';
import 'package:wheater_app/feature/weather/domain/usecases/get_weather_for_current_location.dart';
import 'package:wheater_app/feature/weather/presentation/providers/weather_state.dart';

// Provider for the main weather display (current/searched city)
final weatherNotifierProvider =
    StateNotifierProvider<WeatherNotifier, WeatherState>((ref) {
      return WeatherNotifier(
        ref.watch(getWeatherForCityUseCaseProvider),
        ref.watch(getWeatherForCurrentLocationUseCaseProvider),
        ref, // Pass ref to access other providers like location
      );
    });

class WeatherNotifier extends StateNotifier<WeatherState> { // To access other providers

  WeatherNotifier(
    this._getWeatherForCity,
    this._getWeatherForCurrentLocation,
    this._ref,
  ) : super(const WeatherState.initial());
  final GetWeatherForCity _getWeatherForCity;
  final GetWeatherForCurrentLocation _getWeatherForCurrentLocation;
  final Ref _ref;

  Future<void> fetchWeatherForCity({
    required String cityName,
    required String country,
  }) async {
    state = const WeatherState.loading();
    final result = await _getWeatherForCity(
      cityName: cityName,
      country: country,
    );
    result.fold(
      (failure) => state = WeatherState.error(failure.message),
      (weather) => state = WeatherState.loaded(weather: weather),
    );
    // After fetching, update the saved searches list as well
     _ref.read(savedSearchesNotifierProvider.notifier).fetchSavedSearches().ignore();
  }

  Future<void> fetchWeatherForCurrentLocation() async {
    state = const WeatherState.loading();
    try {
      // Get current position using the FutureProvider
      final position = await _ref.read(currentPositionProvider.future);
      final result = await _getWeatherForCurrentLocation(
        position.latitude,
        position.longitude,
      );
      result.fold(
        (failure) => state = WeatherState.error(failure.message),
        (weather) => state = WeatherState.loaded(weather: weather),
      );
      // After fetching, update the saved searches list as well
      _ref.read(savedSearchesNotifierProvider.notifier).fetchSavedSearches().ignore();
    } catch (e) {
      state = WeatherState.error(
        'Failed to get location or weather: ${e.toString()}',
      );
    }
  }
}

// Provider for the list of saved searches
final savedSearchesNotifierProvider =
    StateNotifierProvider<SavedSearchesNotifier, SavedSearchesState>((ref) {
      return SavedSearchesNotifier(ref.watch(getSavedSearchesUseCaseProvider));
    });

class SavedSearchesNotifier extends StateNotifier<SavedSearchesState> {

  SavedSearchesNotifier(this._getSavedSearches)
    : super(const SavedSearchesState.initial()) {
    fetchSavedSearches(); // Load initially
  }
  final GetSavedSearches _getSavedSearches;

  Future<void> fetchSavedSearches() async {
    state = const SavedSearchesState.loading();
    final result = await _getSavedSearches();
    result.fold(
      (failure) => state = SavedSearchesState.error(failure.message),
      (searches) => state = SavedSearchesState.loaded(searches: searches),
    );
  }
}
