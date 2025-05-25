import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/feature/weather/data/models/unplash_model.dart';
import 'package:wheater_app/feature/weather/data/repositories/unplash_repository_impl.dart';

final getPhotosForCityUseCaseProvider =
    FutureProvider.family<List<Photo>, String>((ref, cityName) {
      final repo = ref.watch(unplashRepositoryProvider);
      return repo.getPhotosFromCityName(cityName);
    });
