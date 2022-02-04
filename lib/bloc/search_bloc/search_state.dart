part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class LocationInitial extends SearchState {
  const LocationInitial();

  @override
  List<Object?> get props => [];
}

class LocationLocating extends SearchState {
  const LocationLocating();

  @override
  List<Object?> get props => [];
}

class LocationQuerried extends SearchState {
  final List<Location> responce;

  const LocationQuerried({
    required this.responce,
  });

  @override
  List<Object?> get props => [responce];
}

class LocationLoaded extends SearchState {
  final Location location;

  const LocationLoaded({
    required this.location,
  });

  @override
  List<Object?> get props => [location];
}

class LocationError extends SearchState {
  final String error;

  const LocationError({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
