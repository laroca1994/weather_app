import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/feature/weather/presentation/providers/default_weather_notifier.dart';
import 'package:wheater_app/feature/weather/presentation/widgets/default_weather_display_card.dart';

class BuildDefaultCitiesList extends ConsumerWidget {
  const BuildDefaultCitiesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaults = ref.watch(defaultWeatherNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...defaults.map((weatherData) {
          return DefaultWeatherDisplayCard(weatherData: weatherData);
        }),
      ],
    );
  }
}
