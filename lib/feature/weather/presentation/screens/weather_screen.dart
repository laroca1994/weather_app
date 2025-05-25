import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/feature/weather/presentation/providers/weather_notifier.dart';
import 'package:wheater_app/feature/weather/presentation/providers/weather_state.dart';
import 'package:wheater_app/feature/weather/presentation/widgets/build_default_cities_list.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherNotifierProvider);

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
          // Re-fetch currently displayed weather or default if none
          if (weatherState is WeatherLoaded) {
            await ref
                .read(weatherNotifierProvider.notifier)
                .fetchWeatherForCity(
                  cityName: weatherState.weather.cityName,
                  country: weatherState.weather.country!,
                );
          } else if (weatherState is WeatherError ||
              weatherState is WeatherInitial) {
            // Optionally fetch for a default city or current location on pull-to-refresh from error/initial
            // For now, just refresh saved searches
          }
          await ref
              .read(savedSearchesNotifierProvider.notifier)
              .fetchSavedSearches();
        },
        child: ListView(
          children: [
            // GooglePlacesSearchBar(
            //   onPlaceSelected: ({required cityName, required country}) {
            //     ref
            //         .read(weatherNotifierProvider.notifier)
            //         .fetchWeatherForCity(cityName: cityName, country: country);
            //   },
            // ),
            // const BuildWeatherContent(),
            // const Divider(height: 20, thickness: 1),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 16.0,
            //     vertical: 8.0,
            //   ),
            //   child: Text(
            //     'Default & Recent Searches',
            //     style: Theme.of(context).textTheme.titleLarge,
            //   ),
            // ),
            // const BuildSavedSearchesList(),
            const BuildDefaultCitiesList(),
          ],
        ),
      ),
    );
  }
}
