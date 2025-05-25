import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
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

class WeatherRepositoryImpl implements WeatherRepository {
  // Assuming you've named your DAO this way

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherDao localDataSource;

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
        final entity = WeatherEntity.fromWeatherModel(weatherModel, null);
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
    WeatherEntity entity, {
    bool isDefault = false,
    int? id,
  }) async {
    final entry = SavedWeatherCompanion(
      id: id != null ? Value(id) : const Value.absent(),
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
      isDefault: Value(isDefault),
      imageUrl: Value(entity.imageUrl),
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
            return WeatherEntity.fromWeatherModel(weatherModel, null);
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

  @override
  Future<WeatherEntity> getWeatherForCity({
    required String cityName,
    required String imageUrl,
  }) async {
    final cachedData = await localDataSource.getWeatherByCityName(
      cityName.toLowerCase(),
    );
    int? id;
    if (cachedData != null) {
      id = cachedData.id;
      // Optional: Check if data is stale (e.g., older than 1 hour)
      if (DateTime.now()
              .difference(cachedData.lastFetched.toLocal())
              .inMinutes <
          60) {
        final weatherModel = WeatherModel.fromJson(
          jsonDecode(cachedData.fullJsonResponse),
        );
        return WeatherEntity.fromWeatherModel(weatherModel, imageUrl);
      }
    }

    final weatherModel = await remoteDataSource.getCurrentWeatherByCity(
      cityName,
    );
    // Check for successful API response
    final entity = WeatherEntity.fromWeatherModel(weatherModel, imageUrl);
    // 3. Save to local cache
    await _saveWeatherToLocal(weatherModel, entity, isDefault: true, id: id);
    return entity;
  }
}
