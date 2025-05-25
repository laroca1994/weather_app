import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wheater_app/feature/weather/presentation/providers/weather_notifier.dart';
import 'package:wheater_app/shared/widgets/weather_display.dart';

class BuildWeatherContent extends ConsumerWidget {
  const BuildWeatherContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherNotifierProvider);
    return weatherState.when(
      data:
          (weather) =>
              weather == null
                  ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text('Search for a city or use current location.'),
                    ),
                  )
                  : WeatherDisplay(weather: weather),
      error:
          (error, _) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                'Error: ${error.toString()}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
      loading:
          () => const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
