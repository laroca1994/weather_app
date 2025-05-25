import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wheater_app/core/errors/failure.dart';
import 'package:wheater_app/feature/weather/domain/services/location_service.dart';

final locationServiceProvider = Provider<LocationServiceImpl>((ref) {
  return LocationServiceImpl();
});

class LocationServiceImpl implements LocationService {
  @override
  Future<Either<Failure, Position>> getCurrentPosition() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Left(LocationFailure('Location services are disabled.'));
    }

    final havePermission = await checkLocationPermission();
    if (!havePermission) {
      return Left(LocationFailure('Location permissions are denied'));
    }

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(),
      );
      return Right(position);
    } catch (e) {
      return Left(
        LocationFailure('Failed to get current location: ${e.toString()}'),
      );
    }
  }

  @override
  Future<bool> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        return false;
      }
    }

    return true;
  }
}
