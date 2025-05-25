import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/feature/weather/presentation/providers/default_weather_notifier.dart';
import 'package:wheater_app/feature/weather/presentation/providers/weather_notifier.dart';
import 'package:wheater_app/feature/weather/presentation/widgets/build_default_cities_list.dart';
import 'package:wheater_app/feature/weather/presentation/widgets/build_weather_content.dart';
import 'package:wheater_app/feature/weather/presentation/widgets/search_bar_widget.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              ref
                  .read(weatherNotifierProvider.notifier)
                  .fetchWeatherForCurrentLocation();
            },
            tooltip: 'Weather for current location',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(defaultWeatherNotifierProvider.notifier).init();
          ref.invalidate(weatherNotifierProvider);
          await ref.read(weatherNotifierProvider.future);
          await ref
              .read(savedSearchesNotifierProvider.notifier)
              .fetchSavedSearches();
        },
        child: ListView(
          children: [
            GooglePlacesSearchBar(
              onPlaceSelected: ({required lat, required lon}) {
                ref
                    .read(weatherNotifierProvider.notifier)
                    .fetchWeatherForCoordinates(lat: lat, lon: lon);
              },
            ),
            const BuildWeatherContent(),
            const BuildDefaultCitiesList(),
          ],
        ),
      ),
    );
  }
}
