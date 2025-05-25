import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/feature/weather/data/datasources/unplash_remote_datasource.dart';
import 'package:wheater_app/feature/weather/data/models/unplash_model.dart';
// For DioException
import 'package:wheater_app/feature/weather/domain/repositories/unplash_repository.dart';

final unplashRepositoryProvider = Provider<UnplashRepositoryImpl>((ref) {
  return UnplashRepositoryImpl(
    remoteDataSource: ref.watch(unplashRemoteDataSourceProvider),
  );
});

class UnplashRepositoryImpl implements UnplashRepository {
  UnplashRepositoryImpl({required this.remoteDataSource});
  final UnplashRemoteDataSource remoteDataSource;

  @override
  Future<List<Photo>> getPhotosFromCityName(String cityName) async {
    final response = await remoteDataSource.getCurrentWeatherByCity(cityName);
    return response.results;
  }
}
