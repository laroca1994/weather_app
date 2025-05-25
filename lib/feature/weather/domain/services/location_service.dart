import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wheater_app/core/errors/failure.dart';

abstract class LocationService {
  Future<Either<Failure, Position>> getCurrentPosition();
  Future<Either<Failure, Unit>> checkLocationPermission();
}
