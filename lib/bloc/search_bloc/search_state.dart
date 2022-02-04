part of 'search_bloc.dart';

class SearchState extends Equatable {
  final String? error;
  final List<Location> responce;

  const SearchState({
    this.error,
    this.responce = const [],
  });

  SearchState copyWith({
    String? error,
    List<Location>? responce,
  }) {
    return SearchState(
      error: error ?? this.error,
      responce: responce ?? this.responce,
    );
  }

  @override
  List<Object?> get props => [error, responce];
}

class LocationLoaded extends SearchState {
  final Location location;

  const LocationLoaded({
    required this.location,
  });

  @override
  List<Object?> get props => [location];
}
