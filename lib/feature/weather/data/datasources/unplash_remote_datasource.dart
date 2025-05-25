import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wheater_app/core/network/open_weather_dio_client.dart';
import 'package:wheater_app/feature/weather/data/models/unplash_model.dart';

part 'unplash_remote_datasource.g.dart';

final unplashRemoteDataSourceProvider = Provider<UnplashRemoteDataSource>((
  ref,
) {
  final dio = ref.watch(openWeatherDioProvider);
  return UnplashRemoteDataSource(dio);
});

@RestApi()
abstract class UnplashRemoteDataSource {
  factory UnplashRemoteDataSource(Dio dio, {String baseUrl}) =
      _UnplashRemoteDataSource;

  @GET('/search/photos')
  Future<ListPhotosApiResponse> getCurrentWeatherByCity(
    @Query('q') String cityName, {
    @Query('units') String orientation = 'landscape', // or 'imperial'
    @Query('lang') String lang = 'es', // For Spanish descriptions
  });
}
