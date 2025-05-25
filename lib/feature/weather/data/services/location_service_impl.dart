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
    // Verificar si el servicio de ubicación está habilitado
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Left(
        LocationFailure(
          'El servicio de ubicación está desactivado. Por favor, activá el GPS desde la configuración del dispositivo.',
        ),
      );
    }

    // Verificar permisos
    final permissionResult = await checkLocationPermission();
    return await permissionResult.fold(Left.new, (_) async {
      try {
        final position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(),
        );
        return Right(position);
      } catch (e) {
        return Left(
          LocationFailure('Error al obtener la ubicación: ${e.toString()}'),
        );
      }
    });
  }

  @override
  Future<Either<Failure, Unit>> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      return Left(
        LocationFailure('Los permisos de ubicación fueron denegados.'),
      );
    }

    if (permission == LocationPermission.deniedForever) {
      return Left(
        LocationFailure(
          'Los permisos de ubicación fueron denegados permanentemente. '
          'Debes habilitarlos desde la configuración del dispositivo.',
        ),
      );
    }

    return const Right(unit); // Permiso concedido
  }
}
