import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wheater_app/core/errors/failure.dart';

class LocationService {
  Future<Either<Failure, Position>>getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Left(LocationFailure('Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Left(LocationFailure('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Left(LocationFailure(
          'Location permissions are permanently denied, we cannot request permissions.'));
    }

    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return Right(position);
    } catch (e) {
      return Left(LocationFailure('Failed to get current location: ${e.toString()}'));
    }
  }
}

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

// Provider to get the current position as a Future
final currentPositionProvider = FutureProvider<Position>((ref) async {
  final locationService = ref.watch(locationServiceProvider);
  final result = await locationService.getCurrentPosition();
  return result.fold(
    (failure) => throw failure, // Propagate failure to FutureProvider's error state
    (position) => position,
  );
});