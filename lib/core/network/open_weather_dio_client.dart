import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wheater_app/core/constants/api_keys.dart';
import 'package:wheater_app/core/constants/app_constants.dart';


final openWeatherDioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.openWeatherMapBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // Add interceptors if needed (e.g., for logging, auth)
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      // Add API key to every request if not handled by Retrofit
      options.queryParameters['appid'] = ApiKeys.openWeatherMapApiKey;
      return handler.next(options);
    },
  ));
  return dio;
});