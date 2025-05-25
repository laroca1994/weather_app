import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/core/router/router.dart';
import 'package:wheater_app/core/utils/weather_icon_mapper.dart';
import 'package:wheater_app/feature/weather/domain/entities/weather_entity.dart';
import 'package:wheater_app/feature/weather/presentation/providers/weather_notifier.dart';
import 'package:wheater_app/shared/widgets/weather_display.dart';

class BuildSavedSearchesList extends ConsumerWidget {
  const BuildSavedSearchesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(savedSearchesNotifierProvider);

    return state.when(
      data:
          (searches) => SingleChildScrollView(
            child: Column(
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
                          .map((weather) => _buildCityListItem(context, weather))
                          .toList(),
            ),
          ),
      error:
          (error, _) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Could not load history: ${error.toString()}',
              style: const TextStyle(color: Colors.orange),
            ),
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildCityListItem(BuildContext context, WeatherEntity weather) {
    return ListTile(
      leading: const Icon(Icons.history),
      title: Text(weather.cityName),
      subtitle: Text(
        '${weather.temperature.round()}°C, ${weather.weatherDescription.capitalizeFirst()}',
      ),
      trailing: getWeatherIcon(weather.weatherIcon, size: 30),
      onTap: () => HistoryDetailRoute($extra: weather).go(context),
    );
  }
}
