import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/core/utils/weather_icon_mapper.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';
import 'package:wheater_app/feature/weather/presentation/providers/weather_notifier.dart';
import 'package:wheater_app/feature/weather/presentation/providers/weather_state.dart';
import 'package:wheater_app/shared/widgets/weather_display.dart';

class BuildSavedSearchesList extends ConsumerWidget {
  const BuildSavedSearchesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(savedSearchesNotifierProvider);
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
                    child: Text('No recent searches.'),
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
