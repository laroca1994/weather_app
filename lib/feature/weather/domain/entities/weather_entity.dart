// To use sub-models like Main, Wind
import 'dart:convert';

import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wheater_app/core/database/app_database.dart';
import 'package:wheater_app/core/models/city_coordinates.dart';
import 'package:wheater_app/feature/weather/data/models/weather_model.dart';

part 'weather_entity.freezed.dart';

@freezed
abstract class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    required String cityName,
    required double temperature,
    required double tempMin,
    required double tempMax,
    required String weatherMain,
    required String weatherDescription,
    required String weatherIcon,
    required int humidity,
    required double windSpeed,
    String? country,
    DateTime? lastFetched, // For UI to know how old the data is
    // Add other fields as needed
    Coord? coordinates, // For map integration or re-fetching
    int? sunrise,
    int? sunset,
    double? feelsLike,
    String? imageUrl,
    String? fullJson,
  }) = _WeatherEntity;

  const WeatherEntity._();

  factory WeatherEntity.fromCitiesCoordinates(CityCoordinates city) =>
      WeatherEntity(
        cityName: city.city,
        imageUrl: city.imageUrl,
        coordinates: Coord(lat: city.lat, lon: city.lon),
        temperature: -1,
        tempMin: -1,
        tempMax: -1,
        weatherMain: '',
        weatherDescription: '',
        weatherIcon: '',
        humidity: -1,
        windSpeed: -1,
      );

  // Optional: A factory to convert from WeatherModel (API response)
  factory WeatherEntity.fromWeatherModel(WeatherModel model, String? imageUrl) {
    if (model.main == null ||
        model.weather == null ||
        model.weather!.isEmpty ||
        model.wind == null ||
        model.name == null) {
      throw Exception(
        'Required data missing from WeatherModel to create WeatherEntity',
      );
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
      lastFetched:
          model.dt != null
              ? DateTime.fromMillisecondsSinceEpoch(
                model.dt! * 1000,
                isUtc: true,
              )
              : DateTime.now(),
      coordinates: model.coord,
      sunrise: model.sys?.sunrise,
      sunset: model.sys?.sunset,
      feelsLike: model.main?.feelsLike,
      imageUrl: imageUrl,
      fullJson: jsonEncode(model.toJson()),
    );
  }

  SavedWeatherCompanion toSavedWeatherCompanion({bool isDefault = false}) =>
      SavedWeatherCompanion(
        cityName: drift.Value(
          cityName.toLowerCase(),
        ), // Store lowercase for consistent lookup
        country: drift.Value(country),
        temperature: drift.Value(temperature),
        tempMin: drift.Value(tempMin),
        tempMax: drift.Value(tempMax),
        weatherMain: drift.Value(weatherMain),
        weatherDescription: drift.Value(weatherDescription),
        weatherIcon: drift.Value(weatherIcon),
        humidity: drift.Value(humidity),
        windSpeed: drift.Value(windSpeed),
        lastFetched: drift.Value(lastFetched ?? DateTime.now()),
        fullJsonResponse: drift.Value(jsonEncode(fullJson)), // Store raw model
        isDefault: drift.Value(isDefault),
        imageUrl: drift.Value(imageUrl),
      );
}
