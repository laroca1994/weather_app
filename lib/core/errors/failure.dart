// lib/core/failure.dart
class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => 'Failure: $message';
}

// lib/core/errors/failure.dart

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}
class LocationFailure extends Failure {
  LocationFailure(super.message);
}
