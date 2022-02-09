part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class GeolocationStarted extends LocationEvent {
  const GeolocationStarted();

  @override
  List<Object> get props => [];
}

class LocationQueried extends LocationEvent {
  final String querry;

  const LocationQueried({
    required this.querry,
  });

  @override
  List<Object> get props => [querry];
}

class LocationSubmitted extends LocationEvent {
  final Location location;

  const LocationSubmitted({
    required this.location,
  });

  @override
  List<Object> get props => [location];
}
