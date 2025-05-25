import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wheater_app/core/database/app_database.dart';
import 'package:wheater_app/core/errors/failure.dart';
import 'package:wheater_app/feature/weather/data/datasources/weather_remote_datasource.dart';
import 'package:wheater_app/feature/weather/data/models/weather_model.dart'; // For DioException
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';
import 'package:wheater_app/feature/weather/domain/repositories/weather_repository.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepositoryImpl(
    remoteDataSource: ref.watch(weatherRemoteDataSourceProvider),
    localDataSource: ref.watch(weatherDaoProvider),
  );
});

class WeatherRepositoryImpl implements WeatherRepository { // Assuming you've named your DAO this way

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherDao localDataSource;

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherForCityAndCountry({
    required String cityName,
    required String country,
  }) async {
    // 1. Try to get from local cache
    final cachedData = await localDataSource.getWeatherByCityName(
      cityName: cityName.toLowerCase(),
      country: country.toLowerCase(),
    );
    if (cachedData != null) {
      // Optional: Check if data is stale (e.g., older than 1 hour)
      if (DateTime.now().difference(cachedData.lastFetched).inMinutes < 60) {
        try {
          final weatherModel = WeatherModel.fromJson(
            jsonDecode(cachedData.fullJsonResponse),
          );
          return Right(WeatherEntity.fromWeatherModel(weatherModel));
        } catch (e) {
          // If parsing fails, proceed to fetch new data
          debugPrint('Error parsing cached JSON: $e');
        }
      }
    }

    // 2. Fetch from remote
    try {
      final weatherModel = await remoteDataSource.getCurrentWeatherByCity(
        cityName,
      );
      if (weatherModel.cod == 200) {
        // Check for successful API response
        final entity = WeatherEntity.fromWeatherModel(weatherModel);
        // 3. Save to local cache
        await _saveWeatherToLocal(weatherModel, entity);
        return Right(entity);
      } else {
        // API returned an error (e.g., city not found)
        return Left(
          ServerFailure(weatherModel.message ?? 'City not found or API error'),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(ServerFailure('City not found: $cityName'));
      }
      return Left(ServerFailure('Failed to connect to server: ${e.message}'));
    } catch (e) {
      return Left(
        ServerFailure('An unexpected error occurred: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherForCoordinates(
    double lat,
    double lon,
  ) async {
    // For coordinates, we usually fetch fresh data, but you could implement caching if desired.
    try {
      final weatherModel = await remoteDataSource
          .getCurrentWeatherByCoordinates(lat, lon);
      if (weatherModel.cod == 200) {
        final entity = WeatherEntity.fromWeatherModel(weatherModel);
        await _saveWeatherToLocal(
          weatherModel,
          entity,
        ); // Save current location weather too
        return Right(entity);
      } else {
        return Left(
          ServerFailure(
            weatherModel.message ?? 'Could not fetch weather for coordinates',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(ServerFailure('Failed to connect to server: ${e.message}'));
    } catch (e) {
      return Left(
        ServerFailure('An unexpected error occurred: ${e.toString()}'),
      );
    }
  }

  Future<void> _saveWeatherToLocal(
    WeatherModel model,
    WeatherEntity entity,
  ) async {
    final entry = SavedWeatherCompanion(
      cityName: Value(
        entity.cityName.toLowerCase(),
      ), // Store lowercase for consistent lookup
      country: Value(entity.country),
      temperature: Value(entity.temperature),
      tempMin: Value(entity.tempMin),
      tempMax: Value(entity.tempMax),
      weatherMain: Value(entity.weatherMain),
      weatherDescription: Value(entity.weatherDescription),
      weatherIcon: Value(entity.weatherIcon),
      humidity: Value(entity.humidity),
      windSpeed: Value(entity.windSpeed),
      lastFetched: Value(entity.lastFetched ?? DateTime.now()),
      fullJsonResponse: Value(jsonEncode(model.toJson())), // Store raw model
    );
    await localDataSource.insertWeather(entry);
  }

  @override
  Future<Either<Failure, List<WeatherEntity>>> getSavedSearches() async {
    try {
      final savedDataList = await localDataSource.getAllSearches();
      final entities =
          savedDataList.map((data) {
            final weatherModel = WeatherModel.fromJson(
              jsonDecode(data.fullJsonResponse),
            );
            return WeatherEntity.fromWeatherModel(weatherModel);
          }).toList();
      // Sort by last fetched, newest first
      entities.sort(
        (a, b) => (b.lastFetched ?? DateTime(0)).compareTo(
          a.lastFetched ?? DateTime(0),
        ),
      );
      return Right(entities);
    } catch (e) {
      return Left(
        CacheFailure('Failed to retrieve saved searches: ${e.toString()}'),
      );
    }
  }
}
