import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wheater_app/core/network/dio_client.dart';
import 'package:wheater_app/data/models/weather_model.dart';

part 'weather_remote_datasource.g.dart';


final weatherRemoteDataSourceProvider = Provider<WeatherRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return WeatherRemoteDataSource(dio);
});

@RestApi()
abstract class WeatherRemoteDataSource {
  factory WeatherRemoteDataSource(Dio dio, {String baseUrl}) = _WeatherRemoteDataSource;

  @GET('/weather')
  Future<WeatherModel> getCurrentWeatherByCity(
    @Query('q') String cityName, {
    @Query('units') String units = 'metric', // or 'imperial'
    @Query('lang') String lang = 'es', // For Spanish descriptions
  });

  @GET('/weather')
  Future<WeatherModel> getCurrentWeatherByCoordinates(
    @Query('lat') double latitude,
    @Query('lon') double longitude, {
    @Query('units') String units = 'metric',
    @Query('lang') String lang = 'es',
  });
}
