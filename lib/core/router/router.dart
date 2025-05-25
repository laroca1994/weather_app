import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wheater_app/feature/history/presentation/screens/history_screen.dart';
import 'package:wheater_app/feature/home/presentation/screens/home_screen.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';
import 'package:wheater_app/feature/weather/presentation/screens/weather_screen.dart';
import 'package:wheater_app/feature/weather_details/presentation/screens/weather_detail_screen.dart';

part 'app_routes.dart';
part 'router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: const WeatherRoute().location,
    debugLogDiagnostics: true, // For debugging
    routes: $appRoutes,
    navigatorKey: rootNavigatorKey,
    errorBuilder:
        (context, state) => const ErrorScreen(message: 'Page not found'),
  );
});

// A simple error screen for routing issues
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({required this.message, super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text(message)),
    );
  }
}

/// A [GoRoute] that force the [$extra] param to be type [T]. Else [extra] property will [null.
abstract class $ExtraTypeGuardRoute<T> extends GoRouteData {
  $ExtraTypeGuardRoute({required this.$extra});

  final dynamic $extra;

  T? get extra => $extra == null || $extra! is! T ? null : $extra! as T;
}

/// A [GoRoute] that force the [$extra] param to be type [T] and non-null. Redirects to [fallbackRedirect] if [$extra] is null.
abstract class $ExtraRequiredRoute<T> extends GoRouteData {
  $ExtraRequiredRoute({required this.$extra});

  final dynamic $extra;

  T? get extra => $extra == null || $extra! is! T ? null : $extra! as T;

  String get fallbackRedirect;

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (extra == null) {
      return fallbackRedirect;
    }
    return null;
  }
}
