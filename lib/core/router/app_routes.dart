part of 'router.dart';

// --- Anotación Principal ---
@TypedStatefulShellRoute<MainHomeShellRouteData>(
  // Referencia la clase de abajo
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    // --- Branch 1: Weather ---
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<WeatherRoute>(
          path: '/weather',
          routes: [TypedGoRoute<WeatherDetailRoute>(path: 'weather-detail')],
        ),
      ],
    ),

    // --- Branch 2: Weather Detail ---
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HistoryRoute>(
          path: '/history',
          routes: [TypedGoRoute<HistoryDetailRoute>(path: 'history-detail')],
        ),
      ],
    ),
  ],
)
class MainHomeShellRouteData extends StatefulShellRouteData {
  const MainHomeShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return HomeScreen(navigationShell: navigationShell);
  }
}

// --- Tus Clases GoRouteData (Añadir pageKey es CRUCIAL) ---
class WeatherRoute extends GoRouteData {
  const WeatherRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WeatherScreen(key: state.pageKey);
  }
}

class HistoryRoute extends GoRouteData {
  const HistoryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HistoryScreen(key: state.pageKey);
  }
}

class WeatherDetailRoute extends $ExtraRequiredRoute<WeatherEntity> {
  WeatherDetailRoute({required super.$extra});

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WeatherDetailScreen(
      key: state.pageKey,
      weather: extra!,
      isDefaultCity: true,
    );
  }

  @override
  String get fallbackRedirect => const WeatherRoute().location;
}

class HistoryDetailRoute extends $ExtraRequiredRoute<WeatherEntity> {
  HistoryDetailRoute({required super.$extra});

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WeatherDetailScreen(
      key: state.pageKey,
      weather: extra!,
      isDefaultCity: false,
    );
  }

  @override
  String get fallbackRedirect => const HistoryRoute().location;
}
