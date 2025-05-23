import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wheater_app/domain/entities/weather_entity.dart';
import 'package:wheater_app/presentation/screens/home_screen.dart';
import 'package:wheater_app/presentation/screens/weather_detail_screen.dart';

enum AppRoute {
  home,
  weatherDetail,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true, // For debugging
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/weather-detail',
        name: AppRoute.weatherDetail.name,
        builder: (context, state) {
          final weatherEntity = state.extra as WeatherEntity?;
          if (weatherEntity == null) {
            // Handle error or redirect, maybe show a snackbar on previous screen
            // For now, just returning an empty container or error screen
            return const ErrorScreen(message: 'Weather data not provided');
          }
          return WeatherDetailScreen(weather: weatherEntity);
        },
      ),
    ],
  );
});

// A simple error screen for routing issues
class ErrorScreen extends StatelessWidget {
  final String message;
  const ErrorScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text(message)),
    );
  }
}