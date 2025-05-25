// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$mainHomeShellRouteData];

RouteBase get $mainHomeShellRouteData => StatefulShellRouteData.$route(
  factory: $MainHomeShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/weather',

          factory: $WeatherRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'weather-detail',

              parentNavigatorKey: WeatherDetailRoute.$parentNavigatorKey,

              factory: $WeatherDetailRouteExtension._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/history',

          factory: $HistoryRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'history-detail',

              parentNavigatorKey: HistoryDetailRoute.$parentNavigatorKey,

              factory: $HistoryDetailRouteExtension._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $MainHomeShellRouteDataExtension on MainHomeShellRouteData {
  static MainHomeShellRouteData _fromState(GoRouterState state) =>
      const MainHomeShellRouteData();
}

extension $WeatherRouteExtension on WeatherRoute {
  static WeatherRoute _fromState(GoRouterState state) => const WeatherRoute();

  String get location => GoRouteData.$location('/weather');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WeatherDetailRouteExtension on WeatherDetailRoute {
  static WeatherDetailRoute _fromState(GoRouterState state) =>
      WeatherDetailRoute($extra: state.extra as dynamic);

  String get location => GoRouteData.$location('/weather/weather-detail');

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $HistoryRouteExtension on HistoryRoute {
  static HistoryRoute _fromState(GoRouterState state) => const HistoryRoute();

  String get location => GoRouteData.$location('/history');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HistoryDetailRouteExtension on HistoryDetailRoute {
  static HistoryDetailRoute _fromState(GoRouterState state) =>
      HistoryDetailRoute($extra: state.extra as dynamic);

  String get location => GoRouteData.$location('/history/history-detail');

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
