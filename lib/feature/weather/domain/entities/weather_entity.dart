// To use sub-models like Main, Wind
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wheater_app/feature/weather/data/models/weather_model.dart';

part 'weather_entity.freezed.dart';

@freezed
abstract class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    required String cityName,
    String? country,
    required double temperature,
    required double tempMin,
    required double tempMax,
    required String weatherMain,
    required String weatherDescription,
    required String weatherIcon,
    required int humidity,
    required double windSpeed,
    DateTime? lastFetched, // For UI to know how old the data is
    // Add other fields as needed
    Coord? coordinates, // For map integration or re-fetching
    int? sunrise,
    int? sunset,
    double? feelsLike,
  }) = _WeatherEntity;

  // Optional: A factory to convert from WeatherModel (API response)
  factory WeatherEntity.fromWeatherModel(WeatherModel model) {
    if (model.main == null || model.weather == null || model.weather!.isEmpty || model.wind == null || model.name == null) {
      throw Exception('Required data missing from WeatherModel to create WeatherEntity');
    }
    return WeatherEntity(
      cityName: model.name!,
      country: model.sys?.country,
      temperature: model.main!.temp!,
      tempMin: model.main!.tempMin!,
      tempMax: model.main!.tempMax!,
      weatherMain: model.weather!.first.main!,
      weatherDescription: model.weather!.first.description!,
      weatherIcon: model.weather!.first.icon!,
      humidity: model.main!.humidity!,
      windSpeed: model.wind!.speed!,
      lastFetched: model.dt != null ? DateTime.fromMillisecondsSinceEpoch(model.dt! * 1000, isUtc: true) : DateTime.now(),
      coordinates: model.coord,
      sunrise: model.sys?.sunrise,
      sunset: model.sys?.sunset,
      feelsLike: model.main?.feelsLike,
    );
  }
}