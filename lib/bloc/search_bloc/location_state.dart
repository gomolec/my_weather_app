part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {
  const LocationInitial();

  @override
  List<Object?> get props => [];
}

class LocationLocating extends LocationState {
  const LocationLocating();

  @override
  List<Object?> get props => [];
}

class LocationQuerried extends LocationState {
  final List<Location> responce;

  const LocationQuerried({
    required this.responce,
  });

  @override
  List<Object?> get props => [responce];
}

class LocationLoaded extends LocationState {
  final Location location;

  const LocationLoaded({
    required this.location,
  });

  @override
  List<Object?> get props => [location];
}

class LocationError extends LocationState {
  final String error;

  const LocationError({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
