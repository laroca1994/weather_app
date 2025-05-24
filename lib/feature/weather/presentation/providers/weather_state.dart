
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';

part 'weather_state.freezed.dart';

@freezed
sealed class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = WeatherInitial;
  const factory WeatherState.loading() = WeatherLoading;
  const factory WeatherState.loaded({required WeatherEntity weather, List<WeatherEntity>? history}) = WeatherLoaded; // Added history
  const factory WeatherState.error(String message) = WeatherError;
}

// For managing the list of saved searches separately or combined
@freezed
sealed class SavedSearchesState with _$SavedSearchesState {
  const factory SavedSearchesState.initial() = SavedSearchesInitial;
  const factory SavedSearchesState.loading() = SavedSearchesLoading;
  const factory SavedSearchesState.loaded({required List<WeatherEntity> searches}) = SavedSearchesLoaded;
  const factory SavedSearchesState.error(String message) = SavedSearchesError;
}