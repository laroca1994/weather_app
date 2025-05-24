import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/core/constants/app_constants.dart';
import 'package:wheater_app/core/utils/weather_icon_mapper.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';
import 'package:wheater_app/feature/weather/presentation/providers/weather_notifier.dart';
import 'package:wheater_app/feature/weather/presentation/providers/weather_state.dart';
import 'package:wheater_app/feature/weather/presentation/widgets/search_bar_widget.dart';
import 'package:wheater_app/shared/widgets/weather_display.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherNotifierProvider);
    final savedSearchesState = ref.watch(savedSearchesNotifierProvider);

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
            // Use GooglePlacesSearchBar if implemented
            GooglePlacesSearchBar(
              onPlaceSelected: ({required cityName, required country}) {
                ref
                    .read(weatherNotifierProvider.notifier)
                    .fetchWeatherForCity(cityName: cityName, country: country);
              },
            ),

            // GooglePlacesSearchBar(onPlaceSelected: (cityName) {
            //   ref.read(weatherNotifierProvider.notifier).fetchWeatherForCity(cityName);
            // }),
            _buildWeatherContent(weatherState, context),
            const Divider(height: 20, thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                'Default & Recent Searches',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            _buildSavedSearchesList(savedSearchesState, ref),
            _buildDefaultCitiesList(context, ref, weatherState),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherContent(WeatherState weatherState, BuildContext context) {
    return switch (weatherState) {
      WeatherInitial() => const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Text('Search for a city or use current location.'),
        ),
      ),
      WeatherLoading() => const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(child: CircularProgressIndicator()),
      ),
      WeatherLoaded(:final weather) => WeatherDisplay(weather: weather),
      WeatherError(:final message) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            'Error: $message',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    };
  }

  Widget _buildSavedSearchesList(SavedSearchesState state, WidgetRef ref) {
    return switch (state) {
      SavedSearchesInitial() ||
      SavedSearchesLoading() => const SizedBox.shrink(), // Or a small loader
      SavedSearchesLoaded(:final searches) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            searches.isEmpty
                ? [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("No recent searches."),
                  ),
                ]
                : searches
                    .map(
                      (weather) =>
                          _buildCityListItem(weather, ref, isRecent: true),
                    )
                    .toList(),
      ),
      SavedSearchesError(:final message) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Could not load history: $message',
          style: const TextStyle(color: Colors.orange),
        ),
      ),
    };
  }

  Widget _buildDefaultCitiesList(
    BuildContext context, // Pass the context to the men
    WidgetRef ref,
    WeatherState currentWeatherState,
  ) {
    // Filter out default cities if they are already in recent searches or currently displayed
    List<(String, String)> citiesToShow = List.from(AppConstants.defaultCities);

    if (currentWeatherState is WeatherLoaded) {
      citiesToShow.removeWhere(
        (city) =>
            city.$1.toLowerCase() ==
            currentWeatherState.weather.cityName.toLowerCase(),
      );
    }

    final savedSearchesAsyncValue = ref.watch(savedSearchesNotifierProvider);
    if (savedSearchesAsyncValue is SavedSearchesLoaded) {
      final recentCityNames =
          savedSearchesAsyncValue.searches
              .map((e) => e.cityName.toLowerCase())
              .toSet();
      citiesToShow.removeWhere(
        (city) => recentCityNames.contains(city.$1.toLowerCase()),
      );
    }

    if (citiesToShow.isEmpty &&
        (savedSearchesAsyncValue is! SavedSearchesLoaded ||
            savedSearchesAsyncValue.searches.isEmpty)) {
      return const SizedBox.shrink(); // Don't show "Default Cities" header if all are covered
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (citiesToShow.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              'Default Cities',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ...citiesToShow.map((cityName) {
          return ListTile(
            title: Text(cityName.$1),
            leading: const Icon(Icons.location_city),
            onTap: () {
              ref
                  .read(weatherNotifierProvider.notifier)
                  .fetchWeatherForCity(
                    cityName: cityName.$1,
                    country: cityName.$2,
                  );
            },
          );
        }),
      ],
    );
  }

  Widget _buildCityListItem(
    WeatherEntity weather,
    WidgetRef ref, {
    bool isRecent = false,
  }) {
    return ListTile(
      leading:
          isRecent
              ? const Icon(Icons.history)
              : const Icon(Icons.location_city),
      title: Text(weather.cityName),
      subtitle: Text(
        '${weather.temperature.round()}°C, ${weather.weatherDescription.capitalizeFirst()}',
      ),
      trailing: getWeatherIcon(weather.weatherIcon, size: 30),
      onTap: () {
        // Option 1: Re-fetch data to ensure it's fresh
        ref
            .read(weatherNotifierProvider.notifier)
            .fetchWeatherForCity(
              cityName: weather.cityName,
              country: weather.country!,
            );
        // Option 2: Navigate directly with cached data (if detail screen supports it)
        // GoRouter.of(ref.context).pushNamed(AppRoute.weatherDetail.name, extra: weather);
      },
    );
  }
}
