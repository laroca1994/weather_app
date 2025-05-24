// Provider to get the current position as a Future
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wheater_app/feature/weather/data/services/location_service_impl.dart';

final currentPositionProvider = FutureProvider<Position>((ref) async {
  final locationService = ref.watch(locationServiceProvider);
  final result = await locationService.getCurrentPosition();
  return result.fold(
    (failure) =>
        throw failure, // Propagate failure to FutureProvider's error state
    (position) => position,
  );
});