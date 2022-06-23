part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class LocationInitialEvent extends LocationEvent {
  const LocationInitialEvent();

  @override
  List<Object> get props => [];
}

class GeolocationStarted extends LocationEvent {
  const GeolocationStarted();

  @override
  List<Object> get props => [];
}

class LocationQueried extends LocationEvent {
  final String query;

  const LocationQueried({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}

class LocationSubmitted extends LocationEvent {
  final Location location;

  const LocationSubmitted({
    required this.location,
  });

  @override
  List<Object> get props => [location];
}
